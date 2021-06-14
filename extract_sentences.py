import sys
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

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--split", type=str, choices=['train', 'validation', 'test'], 
                        help="dataset split: train, validation, test", default='train')
    parser.add_argument("--output_file", type=str, help="output file contains sentences", required=True)
    parser.add_argument("--cache_dir", type=str, help="tensorflow datasets cache directory")

    args = parser.parse_args()
    
    dataset = tfds.load("wiki40b/ja", data_dir=args.cache_dir) 
    with open(args.output_file, 'w') as f:
        for data in tqdm(dataset[args.split]):
            text = data['text'].numpy().decode('UTF-8')
            f.write(break_lines(text))

if __name__ == "__main__":
    main()