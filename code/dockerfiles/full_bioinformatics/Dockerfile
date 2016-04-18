# Roberts Lab
# Aquatic & Fishery Sciences
# University of Washington
# Bioinformatics Image

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## #
# List of bioinformatics software in this image #
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## #
#						#
#########################			#
# SOFTWARE	VERSION #			#
#########################			#
# bedtools	2.25.0  #			#
# bismark	0.15.0  #			#
# blast		2.3.0+  #			#
# bowtie2	2.2.8   #			#
# bsmap		2.90    #			#
# cufflinks	2.1.1   #			#
# fastqc	0.11.5  #			#
# fastx_toolkit	0.0.13  #			#
# samtools	0.1.19  #			#
# tophat	2.1.1   #			#
# trimmomatic	0.36    #			#
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## #



FROM debian:8
MAINTAINER Sam White <samwhite@uw.edu>

# Get fundamental software
RUN apt-get update && \
    apt-get install -y \
    openjdk-7-jre \
    software-properties-common \
    build-essential \
    pkg-config \
    python-setuptools \
    python-numpy \
    python-scipy \
    libncurses5-dev \
    libncursesw5-dev \
    libpng12-0 \
    zlib1g-dev \
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

# Install bedtools (v2.25.0)
RUN wget https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz \
	&& tar -zxvf bedtools-2.25.0.tar.gz \
	&& make -C /usr/local/bioinformatics/bedtools2 \
	&& rm bedtools-2.25.0.tar.gz

ENV PATH /usr/local/bioinformatics/bedtools2:$PATH
    
# Install blast (v2.3.0+)
RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.3.0+-x64-linux.tar.gz \
	&& tar -zxvpf ncbi-blast-2.3.0+-x64-linux.tar.gz \
	&& rm ncbi-blast-2.3.0+-x64-linux.tar.gz

ENV PATH /usr/local/bioinformatics/ncbi-blast-2.3.0+/bin:$PATH

# Install bowtie2 (v2.2.8)
RUN wget --output-document=bowtie2-2.2.8-linux-x86_64.zip \
	https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.8/bowtie2-2.2.8-linux-x86_64.zip/download \
	&& unzip bowtie2-2.2.8-linux-x86_64.zip \
	&& rm bowtie2-2.2.8-linux-x86_64.zip

ENV PATH /usr/local/bioinformatics/bowtie2-2.2.8:$PATH

# Install cufflinks (v2.1.1)
RUN wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.1.1.tar.gz \
	&& tar -zxvf cufflinks-2.1.1.tar.gz \
	&& rm cufflinks-2.1.1.tar.gz

ENV PATH /usr/local/bioinformatics/cufflinks-2.1.1:$PATH

# Install FastQC (v0.11.5)
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip \
	&& unzip fastqc_v0.11.5.zip \
	&& chmod 755 /usr/local/bioinformatics/FastQC/fastqc \
	&& rm fastqc_v0.11.5.zip

ENV PATH /usr/local/bioinformatics/FastQC:$PATH
	
# Install samtools0.1.19 (version required for use with Stacks)
RUN wget --output-document=samtools-0.1.19.tar.bz2 \
	http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2/download \
	&& tar -xjf samtools-0.1.19.tar.bz2 \
	&& make -C /usr/local/bioinformatics/samtools-0.1.19/ \
	&& rm samtools-0.1.19.tar.bz2

# Install tophat (v2.1.1)
RUN wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz \
	&& tar -zxvf tophat-2.1.1.Linux_x86_64.tar.gz \
	&& rm tophat-2.1.1.Linux_x86_64.tar.gz

ENV PATH /usr/local/bioinformatics/tophat-2.1.1.Linux_x86_64:$PATH

# Install trimmomatic (v0.36)
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip \
	&& unzip Trimmomatic-0.36.zip \
	&& echo 'alias trimmomatic="java -jar /usr/local/bioinformatics/Trimmomatic-0.36/trimmomatic-0.36.jar"' >> ~/.bashrc \
	&& rm Trimmomatic-0.36.zip

# Install fastx toolkit (v0.0.13)
RUN wget http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2 \
	&& mkdir /usr/local/bioinformatics/fastx_toolkit \
	&& tar -xjf fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2 -C /usr/local/bioinformatics/fastx_toolkit \
	&& rm fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2

ENV PATH /usr/local/bioinformatics/fastx_toolkit/bin:$PATH

# Install bismark (v0.15.0)
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/bismark/bismark_v0.15.0.tar.gz \
	&& tar -xzf bismark_v0.15.0.tar.gz \
	&& rm bismark_v0.15.0.tar.gz

ENV PATH /usr/local/bioinformatics/bismark_v0.15.0:$PATH

# Install bsmap (v2.90)
RUN wget http://lilab.research.bcm.edu/dldcc-web/lilab/yxi/bsmap/bsmap-2.90.tgz \
	&& tar -xzf bsmap-2.90.tgz \
	&& (cd /usr/local/bioinformatics/bsmap-2.90 && exec make && make install) \
	&& rm bsmap-2.90.tgz

ENV PATH /usr/local/bioinformatics/bsmap-2.90:$PATH

# Install pyrad (v3.0.66)
RUN wget https://github.com/dereneaton/pyrad/archive/3.0.66.tar.gz \
	&& tar -xzf 3.0.66.tar.gz \
	&& (cd /usr/local/bioinformatics/pyrad-3.0.66 && exec python setup.py install && pyrad -h) \
	&& rm 3.0.66.tar.gz

ENV PATH /usr/local/bioinformatics/pyrad-3.0.66:$PATH

# Install muscle (v3.8.31)
RUN wget http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz \
	&& tar -xzf muscle3.8.31_i86linux64.tar.gz \
	&& rm muscle3.8.31_i86linux64.tar.gz

ENV PATH /usr/local/bioinformatics/muscle3.8.31_i86linux64:$PATH

# Install vsearch (v1.11)
RUN wget wget https://github.com/torognes/vsearch/releases/download/v1.11.1/vsearch-1.11.1-linux-x86_64.tar.gz \
	&& tar -xzf vsearch-1.11.1-linux-x86_64.tar.gz
