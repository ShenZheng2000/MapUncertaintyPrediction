cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/HiVT_modified

python train.py \
  --root ../trj_data/maptrv2 \
  --method unc \
  --embed_dim 128