# rpi-gogs-raspbian

[![dockeri.co](http://dockeri.co/image/hypriot/rpi-gogs-raspbian)](https://registry.hub.docker.com/u/hypriot/rpi-gogs-raspbian/)

[![Build Status](http://armbuilder.hypriot.com/api/badge/github.com/hypriot/rpi-gogs-raspbian/status.svg?branch=master)](http://armbuilder.hypriot.com/github.com/hypriot/rpi-gogs-raspbian)

Raspberry Pi compatible Docker Image with a minimal `gogs git` server.

## Details
- [BLOG with tutorial](http://blog.hypriot.com/post/run-your-own-github-like-service-with-docker/)
- [Source Project Page](https://github.com/hypriot)
- [Source Repository](https://github.com/hypriot/rpi-gogs-raspbian)

## Start a gogs git server
```bash
docker run -d --name my-go-git-server --publish 8022:22 --publish 3000:3000 --volume $(pwd)/gogs-data/:/data hypriot/rpi-gogs-raspbian
```
Now you can access the new gogs installation by opening `http://< IP of your Raspberry Pi>:3000` in your browser

## How to create this image

Run all the commands from within the project root directory.

### Build the Docker Image
```bash
make dockerbuild
```

#### Test the Docker Image
```bash
make testimg
```

#### Push the Docker Image to the Docker Hub
* First use a `docker login` with username, password and email address
* Second push the Docker Image to the official Docker Hub

```bash
make push
```

## License

The MIT License (MIT)

Copyright (c) 2015 Hypriot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
