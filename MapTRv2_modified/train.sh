cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/MapTRv2_modified
export PYTHONPATH="${PYTHONPATH}:$(pwd)"

# single gpu (for debug)
python tools/train.py \
    projects/configs/maptrv2/maptrv2_nusc_r50_24ep.py

# multi gpu
bash tools/dist_train.sh \
    projects/configs/maptrv2/maptrv2_nusc_r50_24ep.py 8