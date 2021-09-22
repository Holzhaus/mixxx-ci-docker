FROM archlinux:base-devel
RUN pacman -Syu --noconfirm appstream clang git python python-pip qt5-declarative
ENTRYPOINT ["bash"]
