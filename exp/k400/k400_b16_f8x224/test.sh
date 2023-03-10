NUM_SHARDS=1
NUM_GPUS=1
BATCH_SIZE=256
BASE_LR=1e-5
PYTHONPATH=$PYTHONPATH:./slowfast \
python3 tools/run_net_multi_node.py \
  --init_method tcp://localhost:10125 \
  --cfg /CVDLPT/CVDLPTUniFormerV2/exp/k400/k400_b16_f8x224/config.yaml \
  --num_shards $NUM_SHARDS \
  DATA.PATH_TO_DATA_DIR ./dataset  \
  DATA.PATH_LABEL_SEPARATOR "," \
  TRAIN.EVAL_PERIOD 1 \
  TRAIN.CHECKPOINT_PERIOD 100 \
  TRAIN.BATCH_SIZE $BATCH_SIZE \
  TRAIN.SAVE_LATEST False \
  NUM_GPUS $NUM_GPUS \
  NUM_SHARDS $NUM_SHARDS \
  SOLVER.MAX_EPOCH 55 \
  SOLVER.BASE_LR $BASE_LR \
  SOLVER.BASE_LR_SCALE_NUM_SHARDS False \
  SOLVER.WARMUP_EPOCHS 5. \
  TRAIN.ENABLE False \
  TEST.NUM_ENSEMBLE_VIEWS 4 \
  TEST.NUM_SPATIAL_CROPS 3 \
  TEST.TEST_BEST True \
  TEST.ADD_SOFTMAX True \
  TEST.BATCH_SIZE 128 \
  RNG_SEED 6666 \
  TEST.CHECKPOINT_FILE_PATH /CVDLPT/pretrained_model \
  OUTPUT_DIR /CVDLPT/CVDLPTUniFormerV2
