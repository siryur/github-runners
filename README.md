# GitHub Actions runner image

This repository builds custom **GitHub Actions runner** Docker images.

The image is **based on** the official `summerwind/actions-runner` image from the
[`actions-runner-controller` project](https://github.com/actions/actions-runner-controller).

## Usage

This repository only provides a small extension on top of the upstream runner image
(for example, adding extra tools like the GitHub CLI). For how to run and manage
GitHub runners (including controller setup, configuration, and scaling),
**please follow the original documentation**:

- [`actions-runner-controller` documentation](https://github.com/actions/actions-runner-controller)

## Published image

The CI workflow in this repository builds and publishes images to Docker Hub:

- **Image**: [`siryur/github-runners`](https://hub.docker.com/r/siryur/github-runners)
- **Tags**:
  - `latest`
  - `sha-<full_git_sha>`
