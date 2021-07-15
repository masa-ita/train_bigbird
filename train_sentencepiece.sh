#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Usage: train_sentencepiece.sh <input_file> <model_type> <model_prefix>" 1>&2
  exit 1
fi

/usr/local/bin/spm_train \
  --input=$1 \
  --model_prefix=$3 \
  --vocab_size=32000 \
  --character_coverage=0.9995 \
  --model_type=$2 \
  --max_sentence_length=16384 \
  --unk_id=3 \
  --pad_id=0 \
  --control_symbols="[CLS],[SEP],[MASK]" \
  --user_defined_symbols="_START_ARTICLE_,_START_SECTION_,_START_PARAGRAPH_,_NEWLINE_"
