"""
Build traj_scene_frame index files for the Skeptic geosplit.
Output format: {scene_name: {0: token_0, 1: token_1, ...}}  (same as traj_scene_frame_full_val.pkl)
"""
import pickle
import argparse
from collections import defaultdict

parser = argparse.ArgumentParser()
parser.add_argument('--infos_file', required=True, help='nuscenes_map_infos_val.pkl or _train.pkl')
parser.add_argument('--output', required=True, help='output index pkl path')
args = parser.parse_args()

with open(args.infos_file, 'rb') as f:
    infos = pickle.load(f)

# Group by scene_name, sort by sample_idx within each scene
scenes = defaultdict(list)
for s in infos:
    scenes[s['scene_name']].append(s)

scene_frame_index = {}
for scene_name, samples in scenes.items():
    samples_sorted = sorted(samples, key=lambda x: x['sample_idx'])
    scene_frame_index[scene_name] = {i: s['token'] for i, s in enumerate(samples_sorted)}

total_tokens = sum(len(v) for v in scene_frame_index.values())
print(f"Built index: {len(scene_frame_index)} scenes, {total_tokens} total frames")

with open(args.output, 'wb') as f:
    pickle.dump(scene_frame_index, f)
print(f"Saved to {args.output}")
