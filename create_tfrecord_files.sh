for FILE in $1/*; do
BASENAME=${FILE##*/}
EXT=${FILE##*.}
STEM=${BASENAME%.*}
python3 src/create_pretraining_data.py \
    --input_file=$FILE \
    --output_file=$2/$STEM.tfrecords-$EXT \
    --model_file=$3.model \
    --vocab_file=$3.vocab \
    --do_lower_case=True \
    --max_seq_length=4096 \
    --max_predictions_per_seq=615 \
    --masked_lm_prob=0.15 \
    --random_seed=0 \
    --dupe_factor=10 \
    --do_whole_word_mask=False &
done
