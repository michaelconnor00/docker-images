FROM debian:stable

# Install the libraries required to run ENVI                                                                                                                                                                                         
RUN apt-get update 
RUN apt-get install -y \
    python python-dev python-pip \
    wget curl make gcc \
    libssl-dev \
    libcurl4-openssl-dev \
    libcurl3

# Install Miniconda
RUN echo 'export PATH=/root/conda/bin:$PATH' > /etc/profile.d/conda.sh
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O /root/miniconda.sh
RUN /bin/bash /root/miniconda.sh -b -p /root/conda
RUN rm /root/miniconda.sh
ENV PATH /root/conda/bin:$PATH

# Install GDAL
RUN conda list && conda update conda
RUN conda install -y -c conda-forge gdal libgdal numpy
RUN gdal-config --version
RUN python -c "import osgeo";

# Install gbdxtools
RUN pip install gbdxtools
RUN python -c "from gbdxtools import Interface";

