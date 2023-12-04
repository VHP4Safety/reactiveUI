#!/bin/bash

# Define the names of the images
IMAGE_NAME1="docker-image-type1"
IMAGE_NAME2="docker-image-type2"

# Path to the local folder to be mounted
LOCAL_FOLDER_PATH="/docker"

# Build Docker Images
echo "Building Docker Image 1..."
docker build -t $IMAGE_NAME1 -f Dockerfile1 .

echo "Building Docker Image 2..."
docker build -t $IMAGE_NAME2 -f Dockerfile2 .

# Check if build was successful
if [ $? -ne 0 ]; then
    echo "Docker build failed"
    exit 1
fi

# Run the first Docker container
#echo "Running Docker Image 1..."
#docker run --rm -v $LOCAL_FOLDER_PATH:/data $IMAGE_NAME1

# Run the second Docker container
#echo "Running Docker Image 2..."
#docker run --rm -v $LOCAL_FOLDER_PATH:/data $IMAGE_NAME2
