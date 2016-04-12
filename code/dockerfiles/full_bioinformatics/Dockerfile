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

# Install bedtools (v.2.25.0)
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

# Install bowtie (v2.2.8)
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

# Install FastQC (v.0.11.5)
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

# Install tophat (v.2.1.1)
RUN wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz \
	&& tar -zxvf tophat-2.1.1.Linux_x86_64.tar.gz \
	&& rm tophat-2.1.1.Linux_x86_64.tar.gz

ENV PATH /usr/local/bioinformatics/tophat-2.1.1.Linux_x86_64:$PATH

# Install trimmomatic (v0.36)
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip \
	&& unzip Trimmomatic-0.36.zip \
	&& echo 'alias trimmomatic="java -jar /usr/local/bioinformatics/Trimmomatic-0.36/trimmomatic-0.36.jar"' >> ~/.bashrc \
	&& rm Trimmomatic-0.36.zip
