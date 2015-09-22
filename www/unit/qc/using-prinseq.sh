
#
# Compared to Trimmomatic prinseq is about 100x slower.
#
# Run prinseq and trim bases from the right in a window of 5 bases
prinseq-lite -fastq SRR519926_1.fastq -trim_qual_right 30 -trim_qual_window 4 -min_len 35 -out_good prinseq_1

#
# Run prinseq
#
fastqc prinseq_1.fq
