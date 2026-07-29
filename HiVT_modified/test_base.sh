cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/HiVT_modified

python eval.py \
  --root ../trj_data/maptrv2 \
  --split val \
  --method base \
  --batch_size 32 \
  --ckpt_path logs/base/lightning_logs/version_0/checkpoints/epoch=52-step=16058.ckpt
