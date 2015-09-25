#
# Get the data from SGD.
#
# Visit SGD to see where this data is coming from:
# http://www.yeastgenome.org/download-data/curation
#
curl -O http://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab

# Also get the readme file.
curl -O http://downloads.yeastgenome.org/curation/chromosomal_feature/SGD_features.README

#
# The file name is a bit long. We rename the file to make the examples shorter.
# In the Unix world moving is the same thing as renaming.
#
mv SGD_features.tab sc.tab
mv SGD_features.README README

#
# Paginate through the README with more (may be called 'less' on Unix)
#
more README

#
# How many lines does the file have.
#
wc -l sc.tab

#
# Paginate through the feature file.
#
more sc.tab

#
# Let's look at the head of the file.
#
head sc.tab

#
# Head produces 10 lines by default. We can ask for fewer or more.
#
head -1 sc.tab
head -100 sc.tab

#
# Look at the end of the file.
# Tail takes similar ranges to head.
#
# Usually we always check the head,tail of text files before processing
# to make sure they are what we think.
#
tail sc.tab
tail -1 sc.tab
tail -100 sc.tab

#
# Find simple patterns in the file
#
grep YAL060W sc.tab

# Color the output to see the matches
grep YAL060W sc.tab --color=auto

# We can place the results of the matching into a new file.
grep YAL060W sc.tab > match.tab

# Paginate the match file
head match.tab

#
# Piping (chaining) commands together.
#
# The "pipe" | character makes output flow from one tool into the next one.
#
# How many lines in the file match the word gene?
#
grep gene sc.tab | wc -l

#
# I prefer to write the above differently with the cat command.
#
cat sc.tab | grep gene | wc -l

# cat (from concatenate)
# This makes it clear that we open the file with cat on
# one end and pipe it into the next command. For longer
# constructs it is easy to see where the input is.

#
# If you have one file cat streams the file to the output.
#
cat sc.tab | head

#
# This would write the file to the output twice.
#
cat sc.tab sc.tab | wc -l

#
# How many lines in the file match the word gene?
#
cat sc.tab | grep gene | wc -l

#
# Note how grep works, it matches an entire line.
# The word gene may appear anywhere.
# Sometimes that is what we want, other times it is not
#

#
# Task: We want to find out how many genes are on chromosome 4
#

#
# It looks like this file uses the feature type ORF (column 2) for protein coding genes.
# We will note here ORF means Open Reading Frame and is not equivalent
# to the concept of a protein coding gene!
#
cat sc.tab | grep ORF --color=auto

#
# We really need to cut out column 2 and match on that only to
# avoid spurious matching.
#
# We use the cat command to open the stream - this is not strictly necessary
# but it makes it more obvious how the stream works.
#

# We want to cut out columns from the file.
# The cut command does that.
man cut

#
# Build your commands one at a time.
# Pressing the up arrow recalls the previous line.
#
# Use head or more to throttle/page through the output
#
cat sc.tab | head
cat sc.tab | cut -f 2 | head
cat sc.tab | cut -f 2 | grep ORF | head

# How many rows have the word ORF on them.
cat sc.tab | cut -f 2 | grep ORF | wc -l

#
# How many lines of the above DO NOT match the word Dubious?
#
# In the yeast people's world the word Dubious indicates hypotetical
# information.
#
# Adding the -v flag to grep reverts the action of grep
# it shows lines that do not match.
#
cat sc.tab | grep -v Dubious | cut -f 2,5,9 | wc -l

#
# How many feature types are in this data?
#
cat sc.tab | cut -f 2 > features.tab

#
# To collapse consecutive identical entries we can use the uniq tool.
# What does uniq do?
#
man uniq

#
# To place identical consecutive entries next to one another
# we need to sort the file first
#
cat features.tab | sort | head

#
# Find unique words.
# The uniq command collapses consecutive identical words into one.
#
cat features.tab | sort | uniq | head

#
# Using -c flag to uniq will not only collapse consective entires
# it will print their counts.
#
cat features.tab | sort | uniq -c | head
cat features.tab | sort | uniq -c | tail

#
# We now want to select features on chromosome 4.
#
# As always build your commands one step at a time and look at one step
# at a time.
#
# Press the arrow key to recall previous entry.
#

cat sc.tab | cut -f 2,9 | head
cat sc.tab | cut -f 2,9 | grep ORF | head
cat sc.tab | cut -f 2,9 | grep ORF | grep 4 | head

#
# The above is not quite right. Can you see why?
#
# Always try to validate the results. Using the
# tools we learned about so far we identify the problem.
#
# This will tell you if we select more than chromosome 4
#
cat sc.tab | cut -f 2,9 | grep ORF | grep 4 | sort | uniq -c

#
# The grep 4 will also match 14 we need to use so called
# meta characters \t to represent a tab and inform bash
# that we want the \t expanded. This is done via the construct $'\t'
#
# Now the pattern matches a tab followed by the letter 4.
#
# This now works. Under what circumstances would it fail though?
#
cat sc.tab | cut -f 2,9 | grep ORF | grep $'\t4' | sort | uniq -c




