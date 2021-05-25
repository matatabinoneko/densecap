work_dir=${1}
. ./settings_abci.sh ${work_dir}

qsub -cwd -g $GROUP -l rt_G.large=1 -l h_rt=01:00:00 -o ${work_dir}/train.sh.stdout -e ${work_dir}/train.sh.stderr  -v bash train.discribe.sh $work_dir
