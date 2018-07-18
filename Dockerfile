FROM ubuntu:16.04

MAINTAINER JacobEberhardt <jacob.eberhardt@tu-berlin.de>, Dennis Kuhnert <mail@kyroy.com>

RUN useradd -u 1000 -m zokrates

# ARG RUST_TOOLCHAIN=nightly-2018-06-04
# ARG LIBSNARK_COMMIT=f7c87b88744ecfd008126d415494d9b34c4c1b20
# ENV LIBSNARK_SOURCE_PATH=/home/zokrates/libsnark-$LIBSNARK_COMMIT
ENV LIBSNARK_SOURCE_PATH = /home/zhiguo/application/zk-SNARKs/ZoKrates/libsnark

# RUN apt-get update && apt-get install -y \
#     build-essential \
#     cmake \
#     curl \
#     libboost-all-dev \
#     libgmp3-dev \
#     libprocps3-dev \
#     libssl-dev \
#     pkg-config \
#     python-markdown \
#     git
# RUN apt-get update && apt-get install -y \
#     libprocps3-dev

USER zokrates

# RUN curl https://sh.rustup.rs -sSf | \
    # sh -s -- --default-toolchain $RUST_TOOLCHAIN -y

# ENV PATH=/home/zokrates/.cargo/bin:$PATH
# ENV PATH=/usr/bin:$PATH

# RUN git clone https://github.com/scipr-lab/libsnark.git $LIBSNARK_SOURCE_PATH
# WORKDIR $LIBSNARK_SOURCE_PATH
# RUN git checkout $LIBSNARK_COMMIT
# RUN git submodule update --init --recursive

# WORKDIR /home/zokrates

# COPY --chown=zokrates:zokrates . ZoKrates

RUN cd ZoKrates \
   && cargo build --release
