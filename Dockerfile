FROM julia:latest

# Dependencies
RUN apt-get update && apt-get install -y \
    libzmq-dev bzip2

USER ubuntu

# Install conda, jupyter, and IJulia kernel
RUN julia -e 'Pkg.update(); Pkg.add("IJulia")'

# Setup environment
# [TODO]: This assumes Julia v0.5. Would be nice if this was more general
ENV PATH $PATH:$HOME/.julia/v0.5/Conda/deps/usr/bin

CMD ["jupyter","notebook"]
