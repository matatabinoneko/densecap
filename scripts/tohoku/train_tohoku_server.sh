work_dir=${1}
GPU=${2}

. settings_tohoku_server.sh

CUDA_VISIBLE_DEVICES=${GPU} python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
        --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 1 --max_epochs ${max_epochs} \
        --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-0