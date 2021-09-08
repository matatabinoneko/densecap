GITHUB_path="/home/tasuku/sftp/densecap" # 各自変更する

# trainning
batch_size=14
mask_weight=1.0
sent_weight=0.25
cfgs_file="${GITHUB_path}/cfgs/anet_tohoku_server.yml"
dist_path=${work_dir}/dist
dist_url="file://${dist_path}/nonexistent_file"
id=0
checkpoint_path="${work_dir}/checkpoint/$id"
log_path="${work_dir}/log/$id"
tensorboard_dir="${work_dir}/runs"
max_epochs=20
learning_rate=0.01
seed=1234

# test 
epoch=19
split='validation'
start_from=${checkpoint_path}/model_epoch_$epoch.t7
result_root="${work_dir}/results/$id"

