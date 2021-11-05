setting_file=${1}
work_dir=${2}
GPU=${3}
debug=${4:-false}

if [[ ${debug} == "true"  ]];then
    debug="--debug"
else
    debug=""
fi


. ${setting_file} 

mkdir -p ${result_root}

CUDA_VISIBLE_DEVICES=${GPU} python ${GITHUB_path}/test.py --cfgs_file $cfgs_file --densecap_eval_file ${GITHUB_path}/tools/densevid_eval/evaluate.py \
    --batch_size 1 --start_from ${start_from} --id $id-$epoch \
    --result_root $result_root \
    --embedding gpt2 $debug \
    --val_data_folder $split --learn_mask --gated_mask --cuda | tee ${log_path}/eval-$id-epoch$epoch