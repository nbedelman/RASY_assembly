# RASY_assembly

Generated an assembly for Rana sylvatica based on ~100X pacbio CLR, Arima HiC, and ?X illumina short reads. Pacbio sequencing done by BYU (see Yara for details), other sequencing done by Vertebrate Genome Project

Step 1: constructed reference assembly with redbean assembler (wtdbg2) with the following code:

`wtdbg2 -k 0 -p 19 -K 1000.049988 -A -R -l 5000 --aln-dovetail -1 -S 4 -s 0.05 -X 100 -e 4 -L 5000 -g 6g -t 96 -o $outPrefix -i $readFile
wtpoa-cns -t 96 -i $outPrefix.ctg.lay.gz -fo $outPrefix.raw.fa`

Step 2: sent redbean assembly (RASY_redbean_4.raw.fa) to VGP. They purged duplicates and ran the HiC scaffoler Salsa, though the resulting genome was not high quality (aRanSyl1_s2)

Step 3: sent Salsa assembly to Paul Frandsen to run 2 rounds of Racon polisher with the pacbio sequences (did not yet have illumina) (aRanSyl1_s2_polished2)

Step 4: Ran 3D-DNA Hi-C assembler on aRanSyl1_s2_polished2. Recovered chromosome-level assembly with some apparent micro-misassemblies and not great per-base accuracy (QV ~28)

*At this point, talked with VGP. They were supposed to have bionano sequencing, but it hadn't worked before. I thought they could add the bionano information on top of the 3d-DNA, but they thought taht was out of order. They used my 3D-DNA scaffolds to inform the bionano cmaps (see Olivier), and generated an assembly that I subsequently ran through 3D-DNA. The assembly they sent was ~6.9GB, ~1.7GB of which were long stretches of Ns. The resulting assembly after 3D-DNA also looked to have many more misassemblies However, it had been polished with the illumina reads. Giulio suggested I break the bionano scaffolds at stretches of Ns and scaffold those polished contigs with 3D-DNA* 
