# Hero icons sprite generator

This repository contains a script to generate SVG sprite from Hero Icons. Pre-built SVG files are also available in this repository.

## Prerequisites

- Docker: The script runs in a Docker container, so you need to have Docker installed on your host machine.

## Instructions

Follow these steps to generate the SVG sprite:

1. **Build the Docker Image:**

Run the following command in your terminal to build the Docker image. This command uses the Dockerfile in the current directory to build an image named `svg-sprite-creator`.


```sh
  docker build -t svg-sprite-creator .
```

2. Run the script

Run the following command in your terminal to execute the script. This command runs the `svg-sprite-creator` Docker image and mounts the current directory to `/app/mounted-dir` in the Docker container.


```sh
  docker run -v $(pwd):/app/mounted-dir svg-sprite-creator
```

3. Access the SVG Sprite:
After the script has run, the generated SVG sprite will be available in the build directory in your current directory.
