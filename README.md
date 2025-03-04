# mixxx-ci-docker

Docker Image based on Arch Linux.

- DockerHub: https://hub.docker.com/r/holzhaus/mixxx-ci

Used by GitHub Actions to run the pre-commit workflow on the mixxxdj/mixxx repo.

Latest tag [`20250304`](https://hub.docker.com/layers/holzhaus/mixxx-ci/20250304/images/sha256-f66e22339b46f4ae1b959b653c14a3294d5e52395287a68ba2bd254d357cd08e) features the following software:

    # pacman -Q appstream clang python git qt6-base rustup
    appstream 1.0.4-1
    clang 19.1.7-1
    python 3.13.2-1
    git 2.48.1-2
    qt6-base 6.8.2-3
    rustup 1.28.0-1

    # rustc --version
    rustc 1.85.0 (4d91de4e4 2025-02-17)
