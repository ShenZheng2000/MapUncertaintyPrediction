cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/HiVT_modified

python eval.py \
  --root ../trj_data/maptrv2 \
  --split val \
  --method unc \
  --batch_size 32 \
  --ckpt_path lightning_logs/version_1/checkpoints/epoch=63-step=19391.ckpt