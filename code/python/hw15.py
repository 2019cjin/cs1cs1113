def hs (a):
    l = 1
    if (a == 1):
        print (None)
    else:
        while (a != 1):
            print (a)
            l = l + 1
            if ((a % 2) == 0):
                a = a//2
            else:
                a = 3*a + 1
        print (a)
        print (None)
        print (l)

hs (12)
