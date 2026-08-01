# Fix: Token Mismatch Between Map Predictions and Adaptor Index

## Background

The pipeline has 3 stages:
1. **Map model** (MapTRv2 / Skeptic) → runs inference → `pos_predictions.pkl`
2. **Adaptor** → merges map predictions + NuScenes agent trajectories → `trj_data/`
3. **Trajectory model** (HiVT / DenseTNT) → trains on `trj_data/`

The adaptor matches map predictions to agent trajectory scenes using **sample tokens** (NuScenes frame IDs).

---

## Current Issue

The adaptor index files (`adaptor_files/traj_scene_frame_full_val.pkl`, `_train.pkl`) were given by the original authors. They were built for the **standard NuScenes split** (150 val scenes, 6019 tokens). Both MapTRv2 and Skeptic use the **geosplit** (99 val scenes, 3972 tokens) — different scenes, barely overlapping tokens.

Result: most scenes in `trj_data/` have no `predicted_map`.

| Model | `predicted_map` coverage (before fix) |
|---|---|
| MapTRv2 | 1448 / 4519 scenes (32%) |
| Skeptic | 449 / 4519 scenes (10%) |

- **DenseTNT**: skips scenes without `predicted_map` → trains on tiny fraction → wrong
- **HiVT**: uses GT map when `predicted_map` missing → wrong

---

## Fix (all steps done in order)

### ✅ Step 1 — Generate geosplit adaptor index files

```bash
cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction
bash adaptor/gen_geosplit_index.sh
```

Output:
- `adaptor_files/traj_scene_frame_geosplit_val.pkl` (99 scenes, 3972 frames)
- `adaptor_files/traj_scene_frame_geosplit_train.pkl` (554 scenes, 22255 frames)

### ✅ Step 2 — Update adaptor scripts to use geosplit index

Already done. All three scripts now use `traj_scene_frame_geosplit_val.pkl` / `_train.pkl`:
- `adaptor/run_adaptor.sh`
- `adaptor/run_adaptor_skeptic.sh`
- `adaptor/run_adaptor_skeptic_stage2.sh`

### ✅ Step 3 — Delete stale trj_data

Done. Deleted `trj_data/maptrv2/`, `trj_data/skeptic/`, `trj_data/skeptic_stage2/`.

### ✅ Step 4 — Rerun all adaptors

- ✅ MapTRv2 (`run_adaptor.sh`): done — 9687 train, 449 val scenarios
- ✅ Skeptic stage 2 (`run_adaptor_skeptic_stage2.sh`): done — 9687 train, 449 val scenarios
- ⏳ Skeptic stage 3 (`run_adaptor_skeptic.sh`): **waiting for uncertainty training to finish**

### ✅ Step 5 — Verify coverage

Result (2026-08-01):
```
maptrv2 val:        449/449  (100%)
maptrv2 train:    9687/9687  (100%)
skeptic_stage2 val:  449/449  (100%)
skeptic_stage2 train: 9687/9687 (100%)
```

### ✅ Step 6 — Delete stale HiVT cache

N/A — `trj_data/` was fully deleted and regenerated, so no stale `processed/` cache exists.

### Step 7 — Retrain all trajectory models

**Blocked on**: Skeptic stage 3 adaptor (waiting for uncertainty training → `run_adaptor_skeptic.sh`)

Once Skeptic stage 3 adaptor is done:
```bash
bash HiVT_modified/train_all.sh
bash DenseTNT_modified/train_all.sh
```
