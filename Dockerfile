FROM archlinux:base-devel-20220925.0.89186
RUN pacman -Syu --noconfirm appstream cargo clang git python python-pip qt5-declarative
ENTRYPOINT ["bash"]
