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

## Use this image with the official Helm chart

This image is intended to be used with the official
[`actions-runner-controller` Helm chart](https://github.com/actions/actions-runner-controller/tree/master/charts/actions-runner-controller).

Update your chart values to point the runner image at `siryur/github-runners`.
The exact key depends on the chart version you’re on, but the common pattern is:

```yaml
image:
  actionsRunnerRepositoryAndTag: siryur/github-runners:latest # or: sha-<full_git_sha>
```

Then apply it (example):

```bash
helm upgrade --install actions-runner-controller actions-runner-controller/actions-runner-controller \
  --namespace actions-runner-system --create-namespace \
  -f values.yaml
```
