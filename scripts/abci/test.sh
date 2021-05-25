#! /bin/sh
# Usage: bash generate_jobs.sh > jobs.sh
# and then: bash jobs.sh
# you can do things like: bash generate_jobs.sh | head -1 > job.sh

work_dir=${1}
GPU=${2:-0}
. ./settings_abci.sh ${work_dir} ${GPU}

qsub -cwd -g $GROUP -l rt_G.large=1 -l h_rt=01:00:00 -o ${work_dir}/test.sh.stdout -e ${work_dir}/test.sh.stderr -v bash test_discribe.sh $work_dir ${GPU}
