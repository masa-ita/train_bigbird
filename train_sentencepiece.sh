#!/bin/bash
/usr/local/bin/spm_train \
  --input=/srv/datasets/wiki40b/wiki40b_ja_sentences.txt \
  --model_prefix="/srv/datasets/wiki40b/spm_BPE_32K" \
  --vocab_size=32000 \
  --character_coverage=0.9995 \
  --model_type=bpe \
  --max_sentence_length=16384 \
  --unk_id=3 \
  --pad_id=0 \
  --control_symbols="[CLS],[SEP],[MASK]" \
  --user_defined_symbols="_START_ARTICLE_,_START_SECTION_,_START_PARAGRAPH_,_NEWLINE_"
