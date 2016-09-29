# julia_jupyter
Simply automated Docker build to create a Jupyter server with an updated Julia kernel (built against "latest", currently v0.5)

For example:

    docker run -p 8888:8888 -v `pwd`:/work -w /work bgross27/julia_jupyter
    
Will open a Jupyter notebook server using the current working directory as the tree
