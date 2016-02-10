# Plots annotation growth
import string
import matplotlib.pyplot as plt

data = '''
2000 6
2001 2005
2002 1101
2003 11116
2004 3469
2005 4626
2006 8467
2007 5161
2008 9622
2009 13087
2010 14751
2011 23580
2012 16370
2013 73306
2014 35418
2015 47472
2016 220641
'''
values = map(string.split, data.splitlines())
values = filter(None, values)

# Latest year's counts are always is inflated with unreliable data
values = values[:-1]
labels = [ x[0] for x in values ]
counts = [ int(x[1]) for x in values ]
width = 2
xpos = [ x  for x  in  range(len(counts)) ]

plt.bar(xpos, counts)
plt.ylabel('New Annotations')
plt.xlabel('Year')

xticks = [ x + 0.4 for x in xpos ]
yticks = [ "{:,}".format(x) for x in counts]
plt.xticks(xticks[1::2], labels[1::2])

plt.title('New Annotations per Year')

#plt.show()
plt.savefig("annotation-growth.png")





