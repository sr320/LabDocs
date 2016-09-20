OLSON - SR reviews

---
Reviewers comments: 

Reviewer #1 (Remarks to the Author): 

Olson et al. have generated different C. gigas methylome during its development. They describe the cytosine methylation pattern of father gametes, 72hours larvae and 120hours larvae for two families. For this purpose, they have used a DNA bisulfite conversion followed by a global sequencing. BS-Seq is a robust technology that allows the identification of cytosine methylation at the resolution of a single base. They perform different comparison between the different developmental stages and between the two families. They have used BSMAP and methylkit to perform their alignment and data comparison respectively. These programs are reliable and have been previously widely used to generate this kind of data. The work is really descriptive and the authors discuss the fact that many of the observed differences between the two families occurs in transposable elements. The work is promising but I encourage the authors to revise their current version to improve the quality of their report.


General comments about the claim: 

I have some concerns with the title and the claims of this study that are not convincing "DNA methylation patterns are inherited, as methylation patterns were more similar between the two sires and their offspring compared to methylations pattern differences among developmental stages. " 
The authors did not compare the DNA methylation pattern of the father and their offspring as they used gametes of the father; neither have they shown an inheritance of DNA methylation profile. They rather show that the DNA methylation pattern is influenced by the genetic of each individual and this is what is generally expected. They show that DNA methylation patterns are more different between two families than between developmental stages within a same family. 


Comments about the methodology: 

I have some concerns regarding the design of the biological samples and the authors should clarify their oyster reproduction conditions. Did they mix the gametes from the two males prior to fecundation (design 1)? Or was the fecundation made from a single male sperm for each family (design 2)? 

Design 1: 
- Mix of male 1 and male 2 sperm + female oocytes = family 1 (and analyzed sperm = male 1 + male 2 sperm) 
- Mix of male 1 and male 2 sperm + female oocytes = family 3 (and analyzed sperm = male 1 + male 2 sperm) 

Or 

Design 2: 
- Male 1 sperm + female oocytes = family 1 (and analyzed sperm = male 1 sperm) 
- Male 2 sperm + female oocytes = family 3 (and analyzed sperm = male 3 sperm) 

The analysis of the heritability of DNA methylation has a sense only if the authors used the design 2 and I guess this is what they did. But they should really clarify this point in their methodology. 


Main of the results presented in this study are based on sequence results and some details concerning the sequences and the bioinformatic pipeline are missing : 
- How many reads were obtained per condition? 
- The authors mentioned that they have removed adapter sequences, but do not mention if they have filtered their reads according to quality scores (phred scores for example). If not, it is necessary to mention how good their sequences were based on quality scores. 
- What was the % of aligned sequences using BSMAP for all conditions? 
- What was the final coverage? 
- Did the authors allow some mismatches for their alignment? 
For all these points about the quality of the raw data, it would be useful that the authors add a table (as a supplementary file) that would include the number of raw reads, filtered reads, and aligned reads. 
- A 3x coverage threshold is rather low. Have the authors tried any higher coverage? What was the rationale for using such a low coverage? 
- For differential analysis, have the authors really used p-values? For reliable data, they should use the adjusted q-values. 

Comments about the results: 

The authors indicate that "A total of 189 differentially methylated loci (DMLs) were identified between the two full-sib families. Of these, 99 were found to overlap with a defined genomic region (exon, intron, promoter region, transposable element) (Figure 2) (Table 1)." However, when I went through the table 1, I counted a total of 60 DMLs (17, 2, 16, and 25 for TE, Promoter, Exon and intron respectively). The same comments can be made for the developmentally specific DMLs, where the authors mention a total of 90 DMLs found in defined regions although the table 1 reports 77 DMLs (16, 3, 12, 46 for TE, Promoter, Exon and intron respectively). 

Another comment about the legend of the figure 2: "An asterisk indicates a statistically different distribution relative to the distribution of all CpGs in the oyster genome." However, no asterisks appear in the figure. 

Another comment is that Table 1 and figure 2 are redundant. The authors could bring some more relevant information: 
- How many DMLs occur between each developmental stages: Sperm to 72hours larvae comparison, Sperm to 100hours larvae comparison, 72hours larvae to 100hours larvae comparison. 
- Do some DMLs occur within a same close region? I wonder how a change in methylation in a single CpG could be relevant. Could the authors discuss this point? Have they tried a tiling window analysis as this is possible with the methylkit package. 
- Could the authors provide a list of the position of each DMLs and the corresponding gene annotation when those DMLs occur in a gene (as a supplementary file). 


Comments about the discussion: 

The authors should revise their discussion about transposable elements. "Differentially methylated loci across families were distributed throughout the genome, though a higher proportion was found in transposable elements. This concentration of methylation in transposable elements may be due to selection against altering methylation in functionally important parts of the genome." 
I agree that they found more DMLs in transposable element but they did not show that those TEs display a higher methylation. On the contrary, they discuss later that "transposons are generally unmethylated and contain similar levels of methylation to neighboring"... which contradict what was previously mentioned. 
Furthermore, active transposons are functionally really important for evolutionary mechanisms. In this sense, I would rather favor the contrary hypothesis, that DMLs preferentially occurs in transposon to favor functionally important mechanisms ... and this would be in line with the final perspective of the authors: "future research should focus on the possible relationship of DNA methylation and transposable element activity". 

The following assumption should also be revised as the link between gene expression regulation and DMLs is clearly not established in invertebrates: "For instance, many differentially methylated loci in gene bodies could be lethal or deleterious as they would alter gene expression." 


P13: Adaptation and not adaption 



Reviewer #2 (Technical Comments to the Author): 

The conclusions are drawn from the analysis of too little samples/ signal to be undoubtedly reliable. Additional experiments could dramatically change the conclusions and result in a completely different study. Please see comments to authors. 

Reviewer #2 (Remarks to the Author): 

The paper ‘Indication of family-specific DNA methylation patterns in developing oysters’ by Olson and Roberts explores the question of a possible paternal inheritance of DNA methylation patterns in a marine invertebrate, the pacific oyster, where the role of methylation is not well understood. The question raised, the hypotheses developed and the manuscript writing are sound and deserve attention. However, the manuscript suffers from a number of major concerns in my opinion (see below). 
Study design : 
The authors want to consider methylation profiles during oyster development but only two stages were sampled. In addition, thoses stages are only described in terms of sampling time point (72 and 120 hpf), without mentioning whether this is based on significant phenotypic differences. Assuming development occurs in normal conditions those two samples would correspond to poorly distinct umbo stages (see Zhang et al, 2012), especially without feeding the larvae which woud slow their growth since oyster larvae are considered to start feeding after 24 to 48 hours. 
The point of the study is that oysters may inherit paternal methylation patterns, and this is examined by comparing sperm and corresonding larvae on the one hand, and the different larvae lots on the other hand. However, the ovocyte/maternal component is never examined, which is a problem. Another point is that the putative variability of methylation patterns within oocytes and spermatozoa lots are not considered nor discussed. 
One onteresting hypothesis developed in the manuscript is the potential role of paternal inheritance of epigenetic imprints with regards to selection and environmental adaptation. Therefore it would have been relevant to sample sperm from individuals exposed to distinct environmental conditions which is not the case here. 
Data analyses : 
There are ca. 10 million CpGs in the oyster genome, and the authors find only 40,654 common loci (ie methylated cytosines, as far as I understand) between their samples, which represents ca. 0.4% of the genome CpG cytosines. Why this number is so low is not discussed. Of these, 189 are differentially methylated, which correspond to 0.46% of the common loci. Therefore, the whole study relies on the analysis of 0.0018% of the genome CpG cytosines. Considering that the SNP frequency in the oyster is around 1 every 30 to 60 nucleotides, there is a possibility that the differences rely on polymorphism and not differential methylation. In addition, the authors mention that cytosines with a 3x coverage were analysed in the study, and that differential methylation is set at a 25% threshold, which means to me that if only one read out of 3 from a single library of each sample is different, the methylation will be considered different. The 0.0018% value mentioned above could therefore at
least partly originate in sequencing artifacts or background ‘noise’ instead of true signal, which is also not discussed. From this very low representativity, and although the downstream statistical treatment seems appropriate, there is a too high possibility that the differences in both the genome distibution of DMLs and their relatioship with sperm profiles does originate in genetic - instead of epigenetic - variation if reflecting a real biological phenomenon. More samples, including oocytes and animals exposed to different environments, and an increased sequencing coverage of the samples are required to help adressing the authors’ questions. 

Transposons : 
Independent of the former comments, the study suffers from the lack of distinction between the different types of transposons in the oyster genome. The distribution, analyses and corresponding discussion should take into account the possible distinct influence of methylation with respect to transposons being SINES, LINES, class I or II, etc… with respect to consequences on genome stability, selection and evolution. 
Considering the sequencing coverage, is there a possibility that the abundance of DMLs in transposons over genes results to some extent in the presence of distinct cell types within the sampled larvae ? Those cell types putatively exhibit distinct methylation patterns with respect to their distinct transcriptomes. Such differences may be little, but from methylation data in different organs and developmental stages in oysters gigas and fucata, they likely extend at least to the range of what is observed in transposons here. Therefore the presence of more DMLs in transposons might be influenced by the low signal due to the variability in other genome regions (promoters, introns, etc) which might also be implicated in the low number of common loci identified ? This should be discussed. 
Discussion : 
The discussion is well written and the hypotheses and perspectives within are interesting. However, there are some intriguing and highly speculative considerations to me. 
For example the former comment about genetic variation and high polymorphism is consistent with the study by Jiang et al (2013) in which genetic variation in selection seems important over epigenetic variation. Paragraph 4 ‘Differences in genome….methylation pattern similar to sperm’ (pages 10-11). From this paragraph, the authors discuss a greater similarity between C. gigas and the zebrafish rather than with the closely related oyster species P. fucata, which is highly unexpected and surprising. The pearl oyster displays ‘methylation ratios [that] are mainly influenced by oocytes’. The authors indicate that this may be ‘possibly due to maternal influences on DNA methylation patterns in early larvae, while later stages attain methylation patterns similar to sperm.’. Has such a phenomenon already been demonstrated ? How would it be possible considering the dilution of the sperm signal during development ? How this coud be explained
with regards to phylogenetic proximity / divergence between oysters and a vertebrate ? This needs better explanation and /or experimental evidence. 
The discussion hypotheses about the role of methylatin in transposable elements is very interesting . However, according to Zhang et al (2012), the oyster genome contains both DNA and RNA transposons. According to the positive influence of DNA methylation on transcription, the study should have taken into account the putative disctinct functioning of DNA versus RNA transposons throughout the manuscript. These differences may have critical outcomes in the frame of the authors’ perspectives but are not mentioned (see above). 

Therefore the data analysed are not robust enough to me to support the hypotheses and conclusions. Consequently, the study is mainly speculative and cannot be published in its present form in my opinion. 

