# julia_jupyter
Simply automated Docker build to create a Jupyter server with an updated Julia kernel (built against "latest", currently v0.5)

For example:

    docker run -p 8888:8888 -v `pwd`:/work -w /work bgross27/julia_jupyter
    
Will open a Jupyter notebook server using the current working directory as the tree

Includes the following packages built in:
    HDF5, JSON, OAuth, Requests, PyCall, PyPlot, TimeZones, ParallelDataTransfer

### Adding Julia packages:

Additional Julia packages can easily be installed using the `Pkg.add()` syntax. 

### Adding Python packages:

If you need to install a Python package, you can do so from within a Julia notebook easily using the shell syntax and `conda` like so:

    ;conda install beautifulsoup4

That will install the BeautifulSoup Python library (for parsing HTML), which will then be available through the PyCall package.

### Customizing environment:

Dependencies required by packages can also be installed using the same syntax. For example, to install NLopt, first run:

    ;sudo apt-get install -y libnlopt0

Then you will be able to add the package using `Pkg.add("NLopt")`
