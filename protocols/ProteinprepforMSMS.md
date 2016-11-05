## Protein Preperation for MSMS protocol

### Sonication
1.	Add 100 µl 6M urea in 50 mM NH4HCO3 (ammonium bicarbonate)
2.	Sonicate each sample for 10s, chilling in ethanol + dry ice for 5s and storing on wet ice between sonications.  Repeat twice for each sample (total of 3 times).
3.	Between samples, rinse the sonicating probe with ethanol and nanopure water.
4.	Store at -80°C if not moving directly to sample digestion.

### Protein quantification – BCA Assay (Pierce)
_This can be done prior to trypsin digestion or in parallel._
Aliquot 11 µl of sonicated sample to a clean tube and add 22 µl NH4HCO3 to dilute urea.  Follow the microplate protocol for BCA using 10 µl of sample and Genn’s dilution curve (below).  Lysis buffer = 50 mM NH4HCO3 with 6M urea diluted 1:2.

|    Vial    |    BSA conc. (µg/µl)    |    Vol. lysis buffer (µl)    |    Vol.   BSA & dilution    |
|------------|-------------------------|------------------------------|-----------------------------|
|    B       |    1.5                  |    125                       |    375,   stock             |
|    C       |    1.0                  |    325                       |    325,   stock             |
|    D       |    0.75                 |    175                       |    175,   B                 |
|    E       |    0.5                  |    325                       |    325,   C                 |
|    F       |    0.25                 |    325                       |    325,   E                 |
|    G       |    0.125                |    325                       |    325,   F                 |
|    H       |    0.025                |    400                       |    100,   G                 |
Use BCA protocol equations to calculate the sample volume containing 100 µg of protein. Make sure to correct for any dilutions.

### Mini-Trypsin digestion
This digestion is for total starting volume of 100 µl.  You can either aliquot the volume to equal 100 µg of protein to a new tube and add additional 6M urea in 50 mM NH4HCO3 (Step 9 - save remaining lysed cells/proteins in -80°C freezer), or digest your entire sample if it is <100 µg protein dissolved in 100 µl total volume.
1.	Add 6.6 µl of 1.5 M Tris pH 8.8
2.	Add 2.5 µl 200 mM TCEP and vortex
3.	Test pH of samples to make sure they are still basic.
4.	Incubate samples 1 hour at 37°C
5.	Add 20 µl of 200 mM iodoacetamide (IAA)
6.	Incubate 1 hour, room temperature, in dark
7.	Add 20 µl 200 mM diothiothreitol (DTT, freshly made or frozen), vortex
8.	Incubate 1 hour, room temperature
9.	Aliquot the volume equal to 100 µg of protein to a new tube (save remainder at -80°C)
10.	OPTIONAL: Add ApoA1 to each sample (dilute 1.1 µl 2200 ng/µl stock in 48.9 µl of 50mM NH4HCO3 to make 50 ng/µl) to make 1:300 ratio of ApoA1:total protein.
a.	For 100 µg total protein in a sample, add 333 ng of ApoA1 by adding 6.7 µl of 60 ng/µl ApoA1 solution.
11.	Add LysC at a 1:30 enzyme:protein ratio to each sample. (LysC cleaves at C-terminus of R and K, like trypsin, but works well in 6M urea.)
12.	Incubate 1 hour, room temperature
13.	Add 800 µl 25 mM NH4HCO3 and 200 µl HPLC grade methanol to each tube.
14.	Prepare the number of trypsin bottles needed (you will want 5 µg of trypsin for each sample, or 1 µg trypsin: 20 µg protein).  Add 20 µl water or trypsin buffer to each bottle of trypsin and vortex lightly.  Aliquot 5 µl of trypsin to each sample for 100 µg of sample (1:30 enzyme:protein).
15.	Incubate overnight at room temperature or for 4 hours at 37°C. 
16.	Evaporate samples at 4°C to near dryness on speed vacuum (<20 µl). Store at -80°C.

### Desalting
Solvent A = 60% acetonitrile + 0.1% trifluoroacetic acid
Solvent B = 5% acetonitrile + 0.1% trifluoroacetic acid
1.	Reconstitute samples in 100 µl solvent B.  Ensure pH<2, if it isn’t, add 10 µl increments of 10% formic acid until pH<2.
2.	Prepare spin columns – see table below for column choice.
|    Column   type          |    Sample capacity(µg)    |    Elution volume (µl)    |    Bed   volume (µl)    |
|---------------------------|---------------------------|---------------------------|-------------------------|
|    UltraMicro   Spin      |    0.03-30                |    5-25                   |    50                   |
|    MicroSpin              |    0.05-60                |    10-50                  |    100                  |
|    MacroSpin              |    0.03-300               |    50-150                 |    300                  |
|    96-well   MiniSpin     |    0.03-100               |    30-50                  |    100                  |
|    96-well   MACROspin    |    0.03-300               |    60-150                 |    300                  |

3.	Wash column: Add 200 µl solvent A to columns, spin for 2000 rpm 3 minutes (repeat 3 times)
4.	Equilibrate column: Add 200 µl solvent B to columns, spin for 2000 rpm for 3 minutes (repeat 2 times)
5.	Load protein on column: Add 100 µg of protein digest (1 sample per column).  Spin at 3000 rpm for 3 minutes.  Collect flow-through, put back on column and spin again.
6.	Wash salts through column: Wash columns with 200 µl solvent B, spinning at 3000 rpm for 3 minutes (repeat twice).
7.	Elute peptides: Transfer columns to clean collection tubes.  Add 100 µl solvent A, spin 3000 rpm for 3 minutes (repeat once).
8.	Evaporate samples to near dryness (can be at approximately room temperature).
9.	Reconstitute peptides in 100 µl 2-5% ACN + 1% formic acid.  Store at -80°C.
