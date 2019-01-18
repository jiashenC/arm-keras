from keras.applications.resnet50 import ResNet50
from keras.preprocessing import image
from keras.applications.resnet50 import preprocess_input, decode_predictions
import numpy as np
import time

model = ResNet50(weights='imagenet')

start = time.time()

for _ in range(50):
    img_path = 'data/eagle.jpg'
    img = image.load_img(img_path, target_size=(224, 224))

    x = image.img_to_array(img)
    x = np.expand_dims(x, axis=0)
    x = preprocess_input(x)
    preds = model.predict(x)

print "resnet50: {:.3f}s".format((time.time() - start) / 50)
