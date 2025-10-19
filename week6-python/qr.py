# Generates a QR code
# https://github.com/lincolnloop/python-qrcode
# https://youtu.be/0eNc5lJfZFM&t=7722

# os give me access to files systems
import os
# we used pip install qrcode
import qrcode

# Generate QR code
img = qrcode.make("https://youtu.be/xvFZjo5PgG0")

# Save as file
img.save("qr.png", "PNG")
