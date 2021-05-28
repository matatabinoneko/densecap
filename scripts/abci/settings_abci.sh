work_dir=${1}

export GITHUB_path="/home/acc12586tj/project/densecap" # 各自変更する
export GROUP="gcb50246"
export pyenv_name="miniconda3-3.19.0/envs/densecap"

# trainning
export batch_size=14
export mask_weight=1.0
export sent_weight=0.25
export cfgs_file="${GITHUB_path}/cfgs/anet_abci.yml"
export dist_path=${work_dir}/dist
export dist_url="file://${dist_path}/nonexistent_file"
export id=0
export checkpoint_path="${work_dir}/checkpoint/$id"
export log_path="${work_dir}/log/$id"
export max_epochs=20
export learning_rate=0.01

# test 
export epoch=19
export split='validation'
export start_from=${checkpoint_path}/model_epoch_$epoch.t7
export result_root="${work_dir}/results/$id"


