FROM julia:latest

# Dependencies
RUN apt-get update && apt-get install -y \
    libzmq-dev bzip2

RUN adduser ubuntu
USER ubuntu

# Install conda, jupyter, and IJulia kernel
RUN julia -e 'Pkg.update(); Pkg.add("IJulia")'

# Setup environment
# [TODO]: This assumes Julia v0.5. Would be nice if this was more general
ENV PATH $PATH:/home/ubuntu/.julia/v0.5/Conda/deps/usr/bin
EXPOSE 8888

CMD ["jupyter","notebook","--port=8888","--ip=0.0.0.0","--no-browser","-y"]
