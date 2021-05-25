work_dir=${1}
GPU=${2}
export GITHUB_path="/home/acc12586tj/project/densecap"
export GROUP="gcb50246"

export pyenv_name="miniconda3-3.19.0/envs/densecap"

# trainning
export batch_size=32
export mask_weight=1.0
export sent_weight=0.25
export cfgs_file="${GITHUB_path}/cfgs/anet_abci.yml"
export dist_path=${work_dir}/dist
export dist_url="file://${dist_path}"
export id=0
export checkpoint_path="${work_dir}/checkpoint/$id"
export log_path="${work_dir}/log/$id"
# export world_size=3
export max_epochs=20


# test 
export epoch=19
export split='validation'
export start_from=${checkpoint_path}/model_epoch_$epoch.t7
export result_root="${work_dir}/results/$id"


# mkdir
mkdir -p ${work_dir} ${checkpoint_path} ${log_path} ${result_root} ${dist_path}