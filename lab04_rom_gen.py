def dectobcd(n):
    a = ['0','0000', '0000', '0000']
    s = str(abs(n))
    sz = len(s)
    for i,c in enumerate(s):
        a[4 - sz + i] = bin(int(c))[2:].rjust(4, '0')
    if n < 0:
        a[0] = '1'
    return ''.join(a)

for a in range(16):
    for b in range(16):
        print(dectobcd(a+b), '//addr =', bin(a)[2:].rjust(4, '0') + bin(b)[2:].rjust(4, '0') + '00')
        print(dectobcd(a-b), '//addr =', bin(a)[2:].rjust(4, '0') + bin(b)[2:].rjust(4, '0') + '01')
        print(dectobcd(a*b), '//addr =', bin(a)[2:].rjust(4, '0') + bin(b)[2:].rjust(4, '0') + '10')
        try:
            # print(int(a/b))
            print(dectobcd(int(a/b)), '//addr =', bin(a)[2:].rjust(4, '0') + bin(b)[2:].rjust(4, '0') + '11')
        except:
            print(dectobcd(0), '//addr =', bin(a)[2:].rjust(4, '0') + bin(b)[2:].rjust(4, '0') + '11')
