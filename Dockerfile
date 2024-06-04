ARG ENV
FROM quay.io/centos/centos:stream9 as centos-stream9-env
RUN yum update -y \
    && yum install -y \
      clang \
      cmake3 \
      gdb \
      libasan \
      lld \
      lldb \
      llvm \
      python3-devel \
      python3-pip
ENV CC=clang
RUN pip3 install nuitka==2.3



FROM centos-stream9-env as centos-stream9-asan-env
ENV CFLAGS="-fsanitize=address -fuse-ld=lld -g"
ENV CCFLAGS="-fsanitize=address -fuse-ld=lld -g"
ENV LDFLAGS="-fsanitize=address -fuse-ld=lld -g"




FROM centos-stream9-env as centos-stream9-hwasan-env
ENV CFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"
ENV CCFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"
ENV LDFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"



# FROM ubuntu:20.04 as ubuntu-2004-env
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update -y \
#     && apt-get install -y \
#       clang \
#       cmake \
#       lld \
#       llvm \
#       python3-dev \
#       python3-pip \
#       python3-dbg
# RUN pip3 install nuitka==2.3
#
#
#
# FROM ubuntu-2004-env as ubuntu-2004-asan-env
# ENV CC=clang
# ENV CFLAGS="-fsanitize=address -fuse-ld=lld -g"
# ENV CCFLAGS="-fsanitize=address -fuse-ld=lld -g"
# ENV LDFLAGS="-fsanitize=address -fuse-ld=lld -g"
#
#
#
# FROM ubuntu-2004-env as ubuntu-2004-hwasan-env
# ENV CC=clang
# ENV CFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"
# ENV CCFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"
# ENV LDFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"



FROM ubuntu:24.04 as ubuntu-2404-env
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get install -y \
      clang \
      cmake \
      lld \
      lldb \
      llvm \
      python3-dev \
      python3-pip \
      python3-dbg
ENV CC=clang
RUN pip3 install nuitka==2.3 --break-system-packages



FROM ubuntu-2404-env as ubuntu-2404-asan-env
ENV CFLAGS="-fsanitize=address -fuse-ld=lld -g"
ENV CCFLAGS="-fsanitize=address -fuse-ld=lld -g"
ENV LDFLAGS="-fsanitize=address -fuse-ld=lld -g"



FROM ubuntu-2404-env as ubuntu-2404-hwasan-env
ENV CFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"
ENV CCFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"
ENV LDFLAGS="-fsanitize=hwaddress -fuse-ld=lld -g"



FROM ${ENV} as src
WORKDIR /code
COPY module module
COPY main.py .



FROM src as without-nuitka



FROM src as with-nuitka
RUN python3 -m nuitka --module --show-scons --include-package=module --debug module \
    && mv module.pyi module_backup.pyi \
    && mv module module_backup
