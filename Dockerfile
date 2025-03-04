FROM archlinux:base-devel-20250302.0.316047
RUN pacman -Syu --noconfirm appstream rustup clang git python python-pip qt6-declarative sudo
RUN useradd --uid 1001 --home-dir /github/home --create-home runner \
    && groupadd docker --gid 123 \
    && groupadd sudo \
    && usermod -aG sudo runner \
    && usermod -aG docker runner \
    && echo "%sudo ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
    && echo "Defaults env_keep += \"DEBIAN_FRONTEND\"" >> /etc/sudoers
WORKDIR /github/home
USER runner
ENV PATH="/github/home/.local/bin:/github/home/.cargo/bin:$PATH:/usr/lib/qt6/bin"
ENV PIP_BREAK_SYSTEM_PACKAGES=true
RUN rustup default 1.85.0
ENTRYPOINT ["bash"]
