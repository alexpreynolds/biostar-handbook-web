 # How to get all SRA ids for a project.

# This may take a bit. Save it into a file.
esearch -db sra -query PRJNA257197  | efetch -format runinfo > runinfo.txt

# Look at the file.
head runinfo.txt

# You could now subselect data based on some runinfo properties.
# Select run ids done on August 19, 2014.
# Cut will separate on commans, and keep only the first column.
cat runinfo.txt | grep 'Aug 19, 2014'  | cut -f 1 -d ',' | grep SRR | head -10 > ebola_sraids.txt

# We could now use the ebola_sraids.txt as above to get the data.