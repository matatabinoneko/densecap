#! /bin/sh
# Usage: bash generate_jobs.sh > jobs.sh
# and then: bash jobs.sh
# you can do things like: bash generate_jobs.sh | head -1 > job.sh

setting_file=${1}
work_dir=${2}
GPU=${3:-0}

. ${setting_file} ${work_dir}

qsub -cwd -g $GROUP -l rt_G.large=1 -l h_rt=01:00:00 -o ${work_dir}/test.sh.stdout -e ${work_dir}/test.sh.stderr -v bash test_discribe.sh $setting_file $work_dir ${GPU}
