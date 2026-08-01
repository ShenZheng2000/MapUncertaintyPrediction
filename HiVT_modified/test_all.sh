cd /data3/shenzhen/Waymo_Projects/MapUncertaintyPrediction/HiVT_modified

# MapTRv2 — base
# python eval.py --root ../trj_data/maptrv2 --split val --method base --batch_size 32 \
#   --ckpt_path logs/base/lightning_logs/version_1/checkpoints/epoch=57-step=17573.ckpt

# # MapTRv2 — uncertainty
# python eval.py --root ../trj_data/maptrv2 --split val --method unc --batch_size 32 \
#   --ckpt_path logs/unc/lightning_logs/version_2/checkpoints/epoch=54-step=16664.ckpt

# # Skeptic stage 3 — base (TODO: run once unc_skeptic training finishes)
# # python eval.py --root ../trj_data/skeptic --split val --method base --batch_size 32 \
# #   --ckpt_path logs/base_skeptic/lightning_logs/FILL_IN/checkpoints/FILL_IN.ckpt

# # Skeptic stage 3 — uncertainty (TODO: run once unc_skeptic training finishes)
# # python eval.py --root ../trj_data/skeptic --split val --method unc --batch_size 32 \
# #   --ckpt_path logs/unc_skeptic/lightning_logs/FILL_IN/checkpoints/FILL_IN.ckpt

# # Skeptic stage 2 — base
# python eval.py --root ../trj_data/skeptic_stage2 --split val --method base --batch_size 32 \
#   --ckpt_path logs/base_skeptic_stage2/lightning_logs/version_1/checkpoints/epoch=56-step=17270.ckpt

# # Skeptic stage 2 — uncertainty
# python eval.py --root ../trj_data/skeptic_stage2 --split val --method unc --batch_size 32 \
#   --ckpt_path logs/unc_skeptic_stage2/lightning_logs/version_1/checkpoints/epoch=59-step=18179.ckpt
