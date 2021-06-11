import sys
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
    args = sys.argv

    if len(args) == 3:
        cache_dir = args[1]
    elif len(args) == 2:
        cache_dir = None
    else:
        print('Usage: python wiki40b_to_text.py /path/to/output /path/to/cache')
        exit(1)
    
    dataset = tfds.load("wiki40b/ja", data_dir=cache_dir) 
    with open(args[1], 'w') as f:
        for data in tqdm(dataset['train']):
            text = data['text'].numpy().decode('UTF-8')
            f.write(break_lines(text))

if __name__ == "__main__":
    main()