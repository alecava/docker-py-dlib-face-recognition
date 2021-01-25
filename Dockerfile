FROM python:3.9-buster

RUN apt -y update && \
    apt install -y \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libboost-all-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    python3-pip \
    zip && \
    cd ~ && \
    mkdir -p dlib && \
    git clone https://github.com/davisking/dlib.git dlib/ && \
    cd dlib/ && \
    python setup.py install --compiler-flags "-mfpu=neon" && \
    pip3 install face_recognition && \
    pip3 install image_to_numpy && \
    cd .. && \
    rm -rf dlib && \
    rm -rf .cache && \
    apt purge -y \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libboost-all-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev && \
    apt autoremove -y && apt clean -y
