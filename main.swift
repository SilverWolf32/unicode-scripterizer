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

var script: Script = ScriptSelection.script

if CommandLine.arguments.contains("-S") {
	script = ScriptSelection.fancyScript
}
if CommandLine.arguments.contains("-b") {
	script = ScriptSelection.blackletterLight
}
if CommandLine.arguments.contains("-B") {
	script = ScriptSelection.blackletterBold
}
if CommandLine.arguments.contains("-r") {
	script = ScriptSelection.runes
}
if CommandLine.arguments.contains("-R") {
	script = ScriptSelection.runes
	(script as! RuneScript).spacingMode = .spaced
}
if CommandLine.arguments.contains("-i") {
	script = ScriptSelection.icelandicRunes
}
if CommandLine.arguments.contains("-c") {
	script = ScriptSelection.smallCaps
}
if CommandLine.arguments.contains("-d") {
	script = ScriptSelection.doublestruck
}

let fh = FileHandle.standardInput

while (true) {
	let data = fh.availableData
	if data.count == 0 { // returns empty on EOF
		break
	}
	let str = String(data: data, encoding: .utf8)!
	print(script.convert(str), terminator: "")
	fflush(stdout)
}

