# mixxx-ci-docker

Docker Image based on Arch Linux.

- DockerHub: https://hub.docker.com/r/holzhaus/mixxx-ci

Used by GitHub Actions to run the pre-commit workflow on the mixxxdj/mixxx repo.

Latest tag [`20250305`](https://hub.docker.com/layers/holzhaus/mixxx-ci/20250305/images/sha256-5a2627bdd63c546524e464bc2a7dd69124c09dfb2101cb85e5dc2d2a5c3598da) features the following software:


    # pacman -Q appstream clang python git qt6-base rustup
    appstream 1.0.4-1
    clang 19.1.7-1
    python 3.13.2-1
    git 2.48.1-2
    qt6-base 6.8.2-3
    rustup 1.28.0-1

    # rustc --version
    rustc 1.85.0 (4d91de4e4 2025-02-17)
