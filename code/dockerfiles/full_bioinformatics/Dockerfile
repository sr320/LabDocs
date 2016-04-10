# Roberts Lab
# Bioinformatics Image

FROM debian:8
MAINTAINER Sam White <samwhite@uw.edu>

# Get fundamental software
RUN apt-get update && \
    apt-get install -y \
    openjdk-7-jre \
    software-properties-common \
    build-essential \
    dialog \
    sudo \
    nano \
    curl \
    git \
    man \
    unzip \
    bzip2 \
    wget
    
# Make bioinformatics directory
RUN mkdir /usr/local/bioinformatics

# Set working directory
WORKDIR /usr/local/bioinformatics

# Add bioinformatics directory to PATH
ENV PATH /usr/local/bioinformatics:$PATH
    
# Install blast (v2.3.0+)
#RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.3.0+-x64-linux.tar.gz \
	#&& tar -zxvpf ncbi-blast-2.3.0+-x64-linux.tar.gz \
	#&& rm ncbi-blast-2.3.0+-x64-linux.tar.gz

ENV PATH /usr/local/bioinformatics/ncbi-blast-2.3.0+/bin:$PATH

# Install FastQC (v.0.11.5)
#RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip \
	#&& unzip fastqc_v0.11.5.zip \
	#&& chmod 755 /usr/local/bioinformatics/FastQC/fastqc \
	#&& rm fastqc_v0.11.5.zip

ENV PATH /usr/local/bioinformatics/FastQC:$PATH
	
# Install samtools0.1.19 (version required for use with Stacks)
RUN wget --output-document=samtools-0.1.19.tar.bz2 \
	http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2/download \
	#&& tar -xjf samtools-0.1.19.tar.bz2 \
	#&& cd /usr/local/bioinformatics/samtools-0.1.19/ \
	#&& ./configure \
	#&& make \
	#&& make install \
	#&& rm samtools-0.1.19.tar.bz2


