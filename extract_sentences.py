import sys
import os
import argparse
import re
from tqdm import tqdm
import tensorflow_datasets as tfds

def break_lines(text):
    text += '\n'
    text = re.sub(r'(?:。|？|\?|！|!)([^」|\)|\）|"])', r'。\n\1', text)
    text = re.sub(r'『(.+?)\n(.+?)』', r'『\1\2』', text)
    text = re.sub(r'「(.+?)\n(.+?)」', r'「\1\2」', text)
    text = re.sub(r'（(.+?)\n(.+?)）', r'（\1\2）', text)
    text = re.sub(r'\n+',r'\n', text)
    text = re.sub(r'^\n','', text)
    return(text)

def main(args):
    splits = tfds.even_splits(args.split, n=args.num_output_files)
    for i, split in enumerate(tqdm(splits)):            
        dataset = tfds.load("wiki40b/ja", split=split, data_dir=args.cache_dir)
        output_file = os.path.join(args.output_dir, "{}.{:05d}".format(args.split, i))
        with open(output_file, 'w') as f:
            for data in tqdm(dataset):
                text = data['text'].numpy().decode('UTF-8')
                f.write(break_lines(text))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--split", type=str, choices=['train', 'validation', 'test'], 
                        help="dataset split: train, validation, test", default='train')
    parser.add_argument("--output_dir", type=str, help="output directory", required=True)
    parser.add_argument("--num_output_files", type=int, help="number of output files", default=1)
    parser.add_argument("--cache_dir", type=str, help="tensorflow datasets cache directory")

    args = parser.parse_args()

    main(args)