# trainning
GITHUB_path="/home/tasuku/sftp/densecap"

batch_size=2
mask_weight=1.0
sent_weight=0.25
cfgs_file="${GITHUB_path}/cfgs/anet_debug_tohoku_server.yml"
dist_path=${work_dir}/dist
dist_url="file://${dist_path}"
id=0
checkpoint_path="${work_dir}/checkpoint/$id"
log_path="${work_dir}/log/$id"
world_size=1
max_epochs=2

# test 
epoch=1
split='validation'
start_from=${checkpoint_path}/model_epoch_$epoch.t7
result_root="${work_dir}/results/$id"

# mkdir
mkdir -p ${checkpoint_path} ${log_path} ${result_root} ${dist_path}