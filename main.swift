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

// script choices
// allowed uppercase letters, lowercase letters, and fallback if any
// must be reference type, otherwise it can't contain a reference to itself
class Script {
	let A: Int
	let a: Int
	let allowedUppercase: String
	let allowedLowercase: String
	let fallback: Script?
	
	init(A: Int, a: Int, allowedUppercase: String, allowedLowercase: String, fallback: Script? = nil) {
		self.A = A
		self.a = a
		self.allowedUppercase = allowedUppercase
		self.allowedLowercase = allowedLowercase
		self.fallback = fallback
	}
}
struct ScriptSelection {
	// missing lowercase h
	static let script = Script(
		A: 0x1d434,
		a: 0x1d44e,
		allowedUppercase: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
		allowedLowercase: "abcdefgijklmnopqrstuvwxyz",
		fallback: nil
	)
	// missing several capital letters
	static let blackletterLight = Script(
		A: 0x1d504,
		a: 0x1d51e,
		allowedUppercase: "ABDEFGJKLMNOPQSTUVWXY",
		allowedLowercase: "abcdefghijklmnopqrstuvwxyz",
		fallback: ScriptSelection.blackletterBold
	)
	// all letters!
	static let blackletterBold = Script(
		A: 0x1d56c,
		a: 0x1d586,
		allowedUppercase:"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
		allowedLowercase: "abcdefghijklmnopqrstuvwxyz",
		fallback: nil
	)
}

let A = 0x41
let a = 0x61

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
}

