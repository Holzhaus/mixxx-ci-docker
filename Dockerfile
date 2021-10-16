FROM archlinux:base-devel
RUN pacman -Syu --noconfirm \
    appstream \
    ccache \
    chromaprint \
    clang \
    cmake \
    flac \
    git \
    hidapi \
    lame \
    libebur128 \
    libid3tag \
    libmad \
    libmodplug \
    libmp4v2 \
    libshout \
    libsndfile \
    libtheora \
    libusb \
    lilv \
    lv2 \
    opusfile \
    portaudio \
    portmidi \
    protobuf \
    python \
    python-pip \
    qt6-5compat \
    qt6-base \
    qt6-declarative \
    qt6-imageformats \
    qt6-svg \
    qt6-tools \
    qt6-translations \
    rubberband \
    soundtouch \
    taglib \
    ttf-opensans \
    ttf-ubuntu-font-family \
    upower \
    wavpack

# Install build dependencies for Qt6Keychain
# Necessary due to this issue: https://bugs.archlinux.org/task/72446
RUN pacman -S --noconfirm libsecret qt5-tools sudo

# Create user account for build (makepkg refuses to run as root)
RUN useradd --create-home --home-dir /home/build --user-group build
RUN printf 'build ALL=NOPASSWD: /usr/bin/pacman' | tee -a /etc/sudoers
USER build:build
WORKDIR /home/build

# Build and run Qt6Keychain
RUN mkdir qtkeychain && \
    cd qtkeychain && \
    curl -OL https://raw.githubusercontent.com/archlinux/svntogit-packages/132aed1058c3a9ecf0028614aeb83b8d82e95457/trunk/PKGBUILD && \
    sed -i 's|v$pkgver.tar.gz|a9ee15f1457fa4bfc8673edeaf6ec20b8f110dd6.tar.gz|g' PKGBUILD && \
    sed -i "s|sha256sums=('cc547d58c1402f6724d3ff89e4ca83389d9e2bdcfd9ae3d695fcdffa50a625a8')|sha256sums=('SKIP')|g" PKGBUILD && \
    printf '\n\nprepare() {\nln -s qtkeychain-a9ee15f1457fa4bfc8673edeaf6ec20b8f110dd6 qtkeychain-0.12.0\n}' >> PKGBUILD && \
    makepkg && \
    sudo pacman --noconfirm -U qtkeychain-qt6-0.12.0-1-x86_64.pkg.tar.zst && \
    cd .. && \
    rm -rf qtkeychain

# GitHub Actions requires root fs write privileges
USER root:root
WORKDIR /

ENTRYPOINT ["bash"]
