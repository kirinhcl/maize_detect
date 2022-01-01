from PIL import Image
from itertools import product
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import cv2
import numpy as np
import os
coordinate_min_x = 0
coordinate_min_y = 0
coordinate_max_x = 0
coordinate_max_y = 0
number = 0
#d: the tile size
def tile(filename, dir_in, dir_out, d):
    name, ext = os.path.splitext(filename)
    img = Image.open(os.path.join(dir_in, filename))
    w, h = img.size
    grid = product(range(0, h-h%d, d), range(0, w-w%d, d))
    for i, j in grid:
        box = (j, i, j+d, i+d)
        out = os.path.join(dir_out, f'{name}_{i}_{j}{ext}')
        img.crop(box).save(out)
path = os.path.join('/Users/luchenghao/Downloads/newcut')
path2 = os.path.join('/Users/luchenghao/Downloads/cutted/')
filelist= [file for file in os.listdir(path) if file.endswith('.JPG')]
print(filelist)
for i in filelist:
    print(i)
    #actual_path= os.path.join(path,i)
    #image = mpimg.imread(actual_path)
    tile(i,path,path2,640)
