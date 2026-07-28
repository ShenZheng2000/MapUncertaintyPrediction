cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/MapTRv2_modified
export PYTHONPATH="${PYTHONPATH}:$(pwd)"

# --- GEO VAL (multi gpu) ---
python -m torch.distributed.launch --nproc_per_node=8 --master_port=29503 \
  tools/test.py \
  projects/configs/maptrv2/maptrv2_nusc_r50_24ep.py \
  work_dirs/maptrv2_nusc_r50_24ep/epoch_24.pth \
  --launcher pytorch \
  --eval chamfer \
  --out ../mapping_results/mapping_results_val.pickle

# --- GEO TRAIN (multi gpu) --- 
# no --eval: train split has no matching GT annotation file
python -m torch.distributed.launch --nproc_per_node=8 --master_port=29503 \
  tools/test.py \
  projects/configs/maptrv2/maptrv2_nusc_r50_24ep_test_train.py \
  work_dirs/maptrv2_nusc_r50_24ep/epoch_24.pth \
  --launcher pytorch \
  --out ../mapping_results/mapping_results_train.pickle