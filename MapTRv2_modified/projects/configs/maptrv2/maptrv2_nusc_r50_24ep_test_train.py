# Same as maptrv2_nusc_r50_24ep.py but runs inference on the train split
# Used to generate mapping_results_train.pickle for the adaptor

_base_ = ['maptrv2_nusc_r50_24ep.py']

data_ann = 'data/nuscenes/'

data = dict(
    test=dict(
        ann_file=data_ann + 'nuscenes_map_infos_temporal_train.pkl',
    )
)
