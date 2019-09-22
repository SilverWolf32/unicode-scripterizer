//
// AvailableScripts.swift
// unicode-scripterizer
//
// Created by ArgentWolf on 2019-09-21
//
// This is free and unencumbered software released into the public domain.
// See COPYING.md for more information.
//
// vim:set noet fo=tcqr:
//

// Different sets available for conversion.
// This is a struct instead of an enum so it can contain complex values (Scripts).
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

// Normal A and a, for the start of the conversion.
let A = 0x41
let a = 0x61
