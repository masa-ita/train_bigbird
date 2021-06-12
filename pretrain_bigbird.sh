#!/bin/bash
python3 bigbird/bigbird/pretrain/run_pretraining.py \
    --data_dir tfds://wiki40b/ja \
    --output_dir ${MODEL_DIR} \
    --max_encoder_length 4096 \
    --max_predictions_per_seq 75 \
    --masked_lm_prob 0.15 \
    --substitute_newline " " \
    --do_train \
    --do_eval \
    --do_export \
    --train_batch_size 4 \
    --eval_batch_size 4 \
    --optimizer AdamWeightDecay \
    --learning_rate 1e-4 \
    --num_train_steps 1400000 \
    --num_warmup_steps 10000 \
    --save_checkpoints_steps 50000 \
    --max_eval_steps 1000 \
    --vocab_model ${MODEL_DIR}/sp_wiki40b_32k.model \
    --cls_token_id 4 \
    --sep_token_id 5 \
    --mask_token_id 6 \
    --use_tpu \
    --tpu_name="$TPU_NAME" \
    --tpu_zone=europe-west4-a \
    --gcp_project="$PROJECT_ID" \
    --num_tpu_cores=8 \

