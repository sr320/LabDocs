# Roberts Lab
# Bioinformatics Image

FROM debian:8
MAINTAINTER Sam White <samwhite@uw.edu>

# Get fundamental software
RUN apt-get update && \
    apt-get install -y \    
    software-properties-common \ #installs python, apt-utils and python/perl libraries
    build-essential \
    dialog \
    sudo \
    nano \
    curl \
    git \
    man \
    unzip \
    bzip2 \
    wget \
    
# Make bioinformatics directory
RUN mkdir /usr/local/bioinformatics
    
# Install blast2.3.0
RUN	wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.3.0+-x64-linux.tar.gz \
	&& tar -xvzf ncbi-blast-2.3.0+-x64-linux.tar.gz \
	&& cp ncbi-blast-2.3.0+/bin/* /usr/local/bioinformatics \
	&& rm ncbi-blast-2.3.0+-x64-linux.tar.gz
	
	
# Install samtools0.1.19 (version required for use with Stacks)
RUN wget --output-document=samtools-0.1.19.tar.bz2 \
	http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2/download \
	&& tar -xjf samtools-0.1.19.tar.bz2 -C /usr/local/bioinformatics \
	&& make /usr/local/bioinformatics/samtools-0.1.19/ \
	&& rm samtools-0.1.19.tar.bz2


# Add bioinformatics directory to PATH
	export PATH=/usr/bin/bioinformatics/:$PATH