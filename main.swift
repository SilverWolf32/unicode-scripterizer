//
// main.swift
// unicode-scripterizer
//
// Created by ArgentWolf on 2019-09-21
//
// This is free and unencumbered software released into the public domain.
// See COPYING.md for more information.
//
// vim:set noet fo=tcqr:
//

import Foundation

var script = ScriptSelection.script

if CommandLine.arguments.contains("-b") {
	script = ScriptSelection.blackletterBold
}
if CommandLine.arguments.contains("-B") {
	script = ScriptSelection.blackletterLight
}

let fh = FileHandle.standardInput

while (true) {
	let data = fh.availableData
	if data.count == 0 { // returns empty on EOF
		break
	}
	let str = String(data: data, encoding: .utf8)!
	for char in str {
		var c = char
		// convert to script letters
		if script.allowedUppercase.contains(c) {
			c = Character(UnicodeScalar(Int(c.asciiValue!) + (script.A - A))!)
		} else if (script.fallback?.allowedUppercase.contains(c) ?? false) {
			c = Character(UnicodeScalar(Int(c.asciiValue!) + (script.fallback!.A - A))!)
		}
		if script.allowedLowercase.contains(c) {
			c = Character(UnicodeScalar(Int(c.asciiValue!) + (script.a - a))!)
		} else if (script.fallback?.allowedLowercase.contains(c) ?? false) {
			c = Character(UnicodeScalar(Int(c.asciiValue!) + (script.fallback!.a - a))!)
		}
		print("\(c)", terminator: "")
	}
	fflush(stdout)
}

