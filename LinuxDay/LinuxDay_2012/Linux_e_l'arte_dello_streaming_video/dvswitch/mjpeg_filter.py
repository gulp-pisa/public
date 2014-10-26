#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

i = 0
while True:
    boundary_line = sys.stdin.readline()
    content_type_line = sys.stdin.readline()
    length_line = sys.stdin.readline()
    auth_line = sys.stdin.readline()
    #print boundary_line.strip()
    #print content_type_line.strip()
    #print length_line.strip()
    #print auth_line.strip()
    length = int(length_line.split(' ')[1])
    #print length

    frame = sys.stdin.read(length)
    sys.stdout.write(frame)
    #with open('frame%05d.jpeg' % (i), 'wb') as fout:
    #    fout.write(frame)
    empty_line = sys.stdin.readline()
    assert(empty_line == '\r\n')

    i += 1
