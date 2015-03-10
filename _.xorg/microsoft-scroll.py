#!/usr/bin/python
#coding=utf-8
import struct
import subprocess

infile_path = '/dev/input/by-id/usb-Microsoft_Natural®_Ergonomic_Keyboard_4000-if01-event-kbd'

#long int, long int, unsigned short, unsigned short, unsigned int
FORMAT = 'llHHI'
EVENT_SIZE = struct.calcsize(FORMAT)

in_file = open(infile_path, "rb")

event = in_file.read(EVENT_SIZE)

while event:
    (tv_sec, tv_usec, type, code, value) = struct.unpack(FORMAT, event)

    if type != 0 or code != 0 or value != 0:
        #print("Event type %u, code %u, value: %u at %d, %d" % \
        #    (type, code, value, tv_sec, tv_usec))
        if value == 1:
            if code in (418, 419):
                key = 'Prior' if code == 418 else 'Next'
                subprocess.check_call(["xdotool", 'key', key])

    event = in_file.read(EVENT_SIZE)

in_file.close()
