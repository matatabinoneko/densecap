
work_dir=${1}
GPU=${2}

. settings_tohoku_server.sh

CUDA_VISIBLE_DEVICES=${GPU} python ${GITHUB_path}/test.py --cfgs_file $cfgs_file --densecap_eval_file ${GITHUB_path}/tools/densevid_eval/evaluate.py \
    --batch_size 1 --start_from ${start_from} --id $id-$epoch \
    --result_root $result_root \
    --val_data_folder $split --learn_mask --gated_mask --cuda | tee ${log_path}/eval-$id-epoch$epoch