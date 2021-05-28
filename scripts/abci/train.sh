setting_file=${1}
work_dir=${2}
GPU=${3:-0}

. ${setting_file} ${work_dir}

# mkdir
mkdir -p ${work_dir} ${checkpoint_path} ${log_path} ${result_root} ${dist_path}

# train
qsub -cwd -g $GROUP -l rt_G.large=1 -l h_rt=01:00:00 -o ${work_dir}/train.sh.stdout -e ${work_dir}/train.sh.stderr  -v bash train.discribe.sh $setting_file $work_dir ${GPU}
