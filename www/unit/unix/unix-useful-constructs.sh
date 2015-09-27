# Recursively find all files by name.
find . -name '*.fastq'

# Find files and execute a command on each.
find . -name '*.fastq' | xargs ls -l

# The previous example won't work if file names
# have spaces in them. Extra arguments are needed then.
find . -name '*.fastq' -print0 | xargs -0 -n 1 ls -l
