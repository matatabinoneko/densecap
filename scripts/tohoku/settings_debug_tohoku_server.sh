# trainning
GITHUB_path="/home/tasuku/sftp/densecap" # 各自変更する

batch_size=2
mask_weight=1.0
sent_weight=0.25
cfgs_file="${GITHUB_path}/cfgs/anet_debug_tohoku_server.yml"
dist_path=${work_dir}/dist
dist_url="file://${dist_path}/nonexistent_file"
id=0
checkpoint_path="${work_dir}/checkpoint/$id"
log_path="${work_dir}/log/$id"
tensorboard_dir="${work_dir}/runs"
max_epochs=10
learning_rate=0.1
seed=12345

# test 
epoch=1
split='validation'
start_from=${checkpoint_path}/model_epoch_$epoch.t7
result_root="${work_dir}/results/$id"
