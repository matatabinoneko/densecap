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


CUDA_VISIBLE_DEVICES=${GPU} python ${GITHUB_path}/test.py --cfgs_file $cfgs_file --densecap_eval_file ${GITHUB_path}/tools/densevid_eval/evaluate.py \
    --batch_size 1 --start_from ${start_from} --id $id-$epoch \
    --result_root $result_root \
    --val_data_folder $split --learn_mask --gated_mask --cuda | tee ${log_path}/eval-$id-epoch$epoch