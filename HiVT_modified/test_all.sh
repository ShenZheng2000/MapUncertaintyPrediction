conda activate HiVT
cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/HiVT_modified

# MapTRv2 — base (v1, best epoch=52)
python eval.py --root ../trj_data/maptrv2 --split val --method base --batch_size 32 \
  --ckpt_path logs/base/lightning_logs/version_1/checkpoints/epoch=52-step=16058.ckpt

# MapTRv2 — uncertainty (v2, best epoch=51)
python eval.py --root ../trj_data/maptrv2 --split val --method unc --batch_size 32 \
  --ckpt_path logs/unc/lightning_logs/version_2/checkpoints/epoch=51-step=15755.ckpt

# Skeptic stage 3 — base (v0, best epoch=43)
python eval.py --root ../trj_data/skeptic --split val --method base --batch_size 32 \
  --ckpt_path logs/base_skeptic/lightning_logs/version_0/checkpoints/epoch=43-step=13331.ckpt

# Skeptic stage 3 — uncertainty (v0, best epoch=37)
python eval.py --root ../trj_data/skeptic --split val --method unc --batch_size 32 \
  --ckpt_path logs/unc_skeptic/lightning_logs/version_0/checkpoints/epoch=37-step=11513.ckpt

# Skeptic stage 2 — base (v1, best epoch=48)
python eval.py --root ../trj_data/skeptic_stage2 --split val --method base --batch_size 32 \
  --ckpt_path logs/base_skeptic_stage2/lightning_logs/version_1/checkpoints/epoch=48-step=14846.ckpt

# Skeptic stage 2 — uncertainty (v1, best epoch=49)
python eval.py --root ../trj_data/skeptic_stage2 --split val --method unc --batch_size 32 \
  --ckpt_path logs/unc_skeptic_stage2/lightning_logs/version_1/checkpoints/epoch=49-step=15149.ckpt
