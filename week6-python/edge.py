# https://youtu.be/0eNc5lJfZFM?t=735

from PIL import Image, ImageFilter

before = Image.open("tower.bmp")
after = before.filter(ImageFilter.FIND_EDGES)
after.save("edge-tower.bmp")
