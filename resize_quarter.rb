# Please return the Image object in the "def main"

def main
  img = Image.pick_from_library
  img.resize(img.width * 0.25, img.height * 0.25)
end
