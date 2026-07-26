# export PYTHONPATH="${PYTHONPATH}:/MapUncertaintyPrediction/MapTRv2_modified"
# python tools/train.py /MapUncertaintyPrediction/MapTRv2_modified/projects/configs/maptrv2/maptrv2_nusc_r50_24ep.py --deterministic --no-validate

cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/MapTRv2_modified
export PYTHONPATH="${PYTHONPATH}:$(pwd)"

# single gpu (for debug)
python tools/train.py projects/configs/maptrv2/maptrv2_nusc_r50_24ep.py

# multi gpu
bash tools/dist_train.sh projects/configs/maptrv2/maptrv2_nusc_r50_24ep.py 8