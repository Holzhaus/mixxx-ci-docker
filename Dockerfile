FROM archlinux:base-devel-20250302.0.316047
RUN pacman -Syu --noconfirm appstream rustup clang git python python-pip qt6-declarative && rustup update stable
ENTRYPOINT ["bash"]
