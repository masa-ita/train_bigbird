#!/bin/bash
python3 run_pretraining.py \
    --data_dir gs://${STORAGE_BUCKET}/data/ \
    --output_dir ${MODEL_DIR} \
    --preprocessed_data \
    --max_predictions_per_seq 20 \
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
    --vocab_model_file ${MODEL_DIR}/sp_wiki40b_32k.model \
    --use_nsp \
    --use_tpu \
    --tpu_name="$TPU_NAME" \
    --num_tpu_cores=8

