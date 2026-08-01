# conda activate maptr

cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction

python adaptor/gen_newsplit_index.py \
  --infos_file /scratch/shenzhen/Datasets/nuscenes/nuscenes_map_infos_val.pkl \
  --output adaptor_files/traj_scene_frame_geosplit_val.pkl

python adaptor/gen_newsplit_index.py \
  --infos_file /scratch/shenzhen/Datasets/nuscenes/nuscenes_map_infos_train.pkl \
  --output adaptor_files/traj_scene_frame_geosplit_train.pkl