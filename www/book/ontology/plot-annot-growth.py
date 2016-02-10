# Plots annotation growth
import string
import matplotlib.pyplot as plt

growth = '''
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
'''

citations = '''
2009        55
2010       287
2011       554
2012       833
2013      1070
2014      1190
2015      1337
'''


def parse(text, func=str):
    pairs = map(string.split, text.splitlines())
    pairs = filter(None, pairs)
    x = [ p[0] for p in pairs]
    y = [ func(p[1]) for p in pairs]
    return x, y


def accumu(data):
    total = 0
    for x in data:
        total += x
        yield total


def cumulative_annotations(text):

    x, y = parse(text, func=int)

    xpos = [ i for i in range(len(x)) ]

    y = list(accumu(y))

    plt.bar(xpos, y)
    plt.ylabel('Known Annotations')
    plt.xlabel('Year')

    xticks = [p + 0.4 for p in xpos]
    plt.xticks(xticks[1::2], x[1::2])

    plt.title('Cumulative Annotations per Year')

    plt.show()
    #plt.savefig("cumulative-growth.png")


def new_annotations(text):
    x, y = parse(text, func=int)

    xpos = [ i for i in range(len(x)) ]

    plt.bar(xpos, y)
    plt.ylabel('New Annotations')
    plt.xlabel('Year')

    xticks = [p + 0.4 for p in xpos]
    plt.xticks(xticks[1::2], x[1::2])

    plt.title('New Annotations per Year')

    plt.show()
    # plt.savefig("annotation-growth.png")


def sad_plot(citations, growth):
    cx, cy = parse(citations, func=int)


    gx, gy = parse(growth, func=int)

    cy = list(accumu(cy))
    gy = list(accumu(gy))

    gy = gy [-7:]

    val = [ 100 - 100.0 * (z-gy[0])/gy[-1] for z in gy ]

    print cx
    print cy
    print gy
    print val

    fig, ax1 = plt.subplots()
    ax1.plot(cy, marker='o', color='r', lw=2, ms=8)
    ax2 = ax1.twinx()
    ax2.plot(val, marker='s', color='b', lw=2, ms=8)

    ax1.set_ylabel('Red: Citations for DAVID')
    ax2.set_ylabel('Blue: Completness of information in DAVID (%)')
    ax1.set_xlabel('Year')
    ax1.set_xticklabels(cx)
    plt.title("The citations and completness of the DAVID resource")

    #plt.show()

    plt.savefig("annotation-david.png")

if __name__ == '__main__':
    #new_annotations(growth)
    #cumulative_annotations(growth)
    sad_plot(citations, growth)
