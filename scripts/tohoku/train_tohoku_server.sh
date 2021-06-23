setting_file=${1}
work_dir=${2}
GPU=${3}

# load settings
. ${setting_file} 

# mkdir
mkdir -p ${checkpoint_path} ${log_path} ${result_root} ${dist_path}

# training
CUDA_VISIBLE_DEVICES=${GPU} python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
        --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 1 --max_epochs ${max_epochs} --learning_rate ${learning_rate} \
        --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask --seed ${seed}| tee ${log_path}/${id}-0


# CUDA_VISIBLE_DEVICES=0 python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
#         --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 3 --rank 0 --max_epochs ${max_epochs} \
#         --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-0

# CUDA_VISIBLE_DEVICES=1 python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
#         --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 3 --rank 1 --max_epochs ${max_epochs} \
#         --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-1

# CUDA_VISIBLE_DEVICES=2 python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
#         --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 3 --rank 2 --max_epochs ${max_epochs} \
#         --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-2
