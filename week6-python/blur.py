# https://youtu.be/0eNc5lJfZFM?t=596

from PIL import Image, ImageFilter

before = Image.open("tower.bmp")
after = before.filter(ImageFilter.BoxBlur(10))
after.save("blur-tower.bmp")

