# base OS image
FROM arm32v7/ubuntu:latest

# install initial packages
RUN apt-get update && apt-get install -y build-essential \
    curl \
    pkg-config \
    python \
    python-dev \
    python-pip \
    python-h5py \
    unzip \
    libblas3 \
    liblapack3 \
    liblapack-dev \
    libblas-dev \
    gfortran

# set current working directory
WORKDIR /server

# copy everything into working directory
COPY . /server

# install prebuild tensorflow image
RUN pip install --upgrade pip
RUN pip install wheels/tensorflow-1.12.0-cp27-none-linux_armv7l.whl

# install dependencies
RUN pip install -r requirements.txt 

# run test sample
CMD ["python", "resnet50.py"]
