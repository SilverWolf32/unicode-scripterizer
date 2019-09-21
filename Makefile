#
# Makefile for unicode-scripterizer
# vim:set fo=tcqr:
#
# This is free and unencumbered software released into the public domain.
# See COPYING.md for more information.
#

unicode-scripterizer: *.swift
	swiftc -g -lncurses -o unicode-scripterizer *.swift

clean:
	rm -f unicode-scripterizer
	rm -rf *.dSYM/
