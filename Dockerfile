FROM julia:latest

# Dependencies
RUN apt-get update && apt-get install -y \
    libzmq3-dev bzip2 hdf5-tools

RUN adduser ubuntu
USER ubuntu

# Install conda, jupyter, and IJulia kernel
RUN julia -e 'Pkg.update(); Pkg.add("IJulia")'

# Install some common packages
RUN julia -e 'for p in ["HDF5","JSON"]; Pkg.add(p); end'

# Setup environment
# [TODO]: This assumes Julia v0.5. Would be nice if this was more general
ENV PATH $PATH:/home/ubuntu/.julia/v0.5/Conda/deps/usr/bin
EXPOSE 8888

CMD ["jupyter","notebook","--port=8888","--ip=0.0.0.0","--no-browser","-y"]
