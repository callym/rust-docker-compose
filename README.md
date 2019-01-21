# Rust + Cargo Make + Docker Compose

A Dockerfile that contains the latest Rust stable release, [`cargo-make`](https://github.com/sagiegurari/cargo-make) build tool, and `docker-compose` cli tool.

I made this for use in Gitlab CI, and if you look in the commit history, then you can see many failed attempts to get docker-in-docker working on this image too.
Instead, you can put this in your `.gitlab-ci.yml`

```yaml
image: 'callym/rust-make-docker-compose:latest'

services:
  - docker:dind

variables:
  DOCKER_HOST: tcp://docker:2375
  DOCKER_DRIVER: overlay2
```
