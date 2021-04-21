# ffmpeg-concat Docker

Docker image for [transitive-bullshit/ffmpeg-concat](https://github.com/transitive-bullshit/ffmpeg-concat)

# Usage

## CLI

```
$ docker run --rm -w /app -v $(pwd):/app --init amanekey/ffmpeg-concat ffmpeg-concat movie1.mp4 movie2.mp4 -d 1000 -o output.mp4
```

## Node.js

```
$ docker run --rm -w /app -v $(pwd):/app --init amanekey/ffmpeg-concat node index.js
```
