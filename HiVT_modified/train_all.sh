cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/HiVT_modified

# MapTRv2 — base trajectory model
# python train.py --root ../trj_data/maptrv2 --method base --embed_dim 128 --default_root_dir logs/base

# MapTRv2 — uncertainty trajectory model
# CUDA_VISIBLE_DEVICES=1 python train.py --root ../trj_data/maptrv2 --method unc --embed_dim 128 --default_root_dir logs/unc

# Skeptic stage 3 — base trajectory model (TODO: run once unc_skeptic training finishes)
# python train.py --root ../trj_data/skeptic --method base --embed_dim 128 --default_root_dir logs/base_skeptic

# Skeptic stage 3 — uncertainty trajectory model (TODO: run once unc_skeptic training finishes)
# python train.py --root ../trj_data/skeptic --method unc --embed_dim 128 --default_root_dir logs/unc_skeptic

# Skeptic stage 2 — base trajectory model
# CUDA_VISIBLE_DEVICES=2 python train.py --root ../trj_data/skeptic_stage2 --method base --embed_dim 128 --default_root_dir logs/base_skeptic_stage2

# Skeptic stage 2 — uncertainty trajectory model
# CUDA_VISIBLE_DEVICES=3 python train.py --root ../trj_data/skeptic_stage2 --method unc --embed_dim 128 --default_root_dir logs/unc_skeptic_stage2