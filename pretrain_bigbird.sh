#!/bin/bash
python3 run_pretraining.py \
    --data_dir ${DATA_DIR} \
    --output_dir ${MODEL_DIR} \
    --preprocessed_data \
    --max_encoder_length 4096 \
    --max_predictions_per_seq 20 \
    --do_train \
    --do_eval \
    --do_export \
    --train_batch_size 2 \
    --eval_batch_size 4 \
    --optimizer AdamWeightDecay \
    --learning_rate 1e-4 \
    --num_train_steps 100000 \
    --num_warmup_steps 10000 \
    --save_checkpoints_steps 5000 \
    --max_eval_steps 1000 \
    --vocab_model_file ${MODEL_DIR}/spm_BPE_32K.model \
    --cls_token_id 4 \
    --sep_token_id 5 \
    --mask_token_id 6 \
    --use_nsp \
    --use_tpu \
    --tpu_name="$TPU_NAME" \
    --num_tpu_cores=8
# shutdown
sudo shutdown -h now
 