setting_file=${1}
work_dir=${2}
GPU=${3}

. ${setting_file} ${work_dir}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

### activate virtual environment with pyenv ###
# pyenv activate <your_virtual_environment>
pyenv activate ${pyenv_name}

### おまじない ###
export LANG=C.UTF-8
export PYTHONIOENCODING=utf-8
export LC_ALL=ja_JP.UTF-8


CUDA_VISIBLE_DEVICES=0 python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
        --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 1 --max_epochs ${max_epochs} \
        --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-0


# for i in $(seq 0 $((world_size-1))); do
#     CUDA_VISIBLE_DEVICES=${i} python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
#         --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size ${world_size} \
#         --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-${i}
# done

# CUDA_VISIBLE_DEVICES=0 python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
#         --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 4 --rank 0 --max_epochs ${max_epochs} \
#         --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-0

# CUDA_VISIBLE_DEVICES=1 python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
#         --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 4 --rank 1 --max_epochs ${max_epochs} \
#         --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-1

# CUDA_VISIBLE_DEVICES=2 python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
#         --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 4 --rank 2 --max_epochs ${max_epochs} \
#         --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-2

# CUDA_VISIBLE_DEVICES=3 python ${GITHUB_path}/train.py --dist_url $dist_url --cfgs_file $cfgs_file \
#         --checkpoint_path $checkpoint_path --batch_size $batch_size --world_size 4 --rank 3 --max_epochs ${max_epochs} \
#         --cuda --sent_weight $sent_weight --mask_weight $mask_weight --gated_mask | tee ${log_path}/${id}-3