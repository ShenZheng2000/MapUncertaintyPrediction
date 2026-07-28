# conda activate maptr (if you don't want a new conda env)
# pip install trajdata==1.3.1 --no-deps
# pip install "trajdata[nusc]" --no-deps
# pip install dill zarr kornia bokeh numcodecs asciitree fasteners --no-deps

cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction
mkdir -p trj_data/maptrv2
cd adaptor

run() {
    python adaptor.py \
      --version trainval \
      --map_model MapTR \
      --dataroot ../MapTRv2_modified/data/nuscenes \
      --gt_map_file ../adaptor_files/gt_full_val.pickle \
      --save_path ../trj_data/maptrv2 \
      --split "$1" \
      --index_file "$2" \
      --map_file "$3"
}

run val   ../adaptor_files/traj_scene_frame_full_val.pkl   ../mapping_results/mapping_results_val.pickle
run train ../adaptor_files/traj_scene_frame_full_train.pkl ../mapping_results/mapping_results_train.pickle