# conda activate maptr

cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction
mkdir -p trj_data/skeptic
cd adaptor

run() {
    python adaptor.py \
      --version trainval \
      --map_model Skeptic \
      --dataroot ../MapTRv2_modified/data/nuscenes \
      --gt_map_file ../adaptor_files/gt_full_val.pickle \
      --save_path ../trj_data/skeptic \
      --split "$1" \
      --index_file "$2" \
      --map_file "$3"
}

# === Skeptic stage 3 — with uncertainty ===
run val   ../adaptor_files/traj_scene_frame_geosplit_val.pkl   /data3/shenzhen/Waymo_Projects/mapping-like-skeptic/work_dirs/mls_nusc_new_3_joint_finetune_uncertainty/pos_predictions.pkl
run train ../adaptor_files/traj_scene_frame_geosplit_train.pkl /data3/shenzhen/Waymo_Projects/mapping-like-skeptic/work_dirs/mls_nusc_new_3_joint_finetune_uncertainty_train_infer/pos_predictions.pkl