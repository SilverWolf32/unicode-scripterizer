//
// ContiguousScript.swift
// unicode-scripterizer
//
// Created by ArgentWolf on 2019-12-02
//
// This is free and unencumbered software released into the public domain.
// See COPYING.md for more information.
//
// vim:set noet fo=tcqr:
//

class ContiguousScript: Script {
	
	// Normal A and a, for the start of the conversion.
	static let A = 0x41
	static let a = 0x61
	
	let A: Int
	let a: Int
	let allowedUppercase: String
	let allowedLowercase: String
	let fallback: ContiguousScript?
	
	init(A: Int, a: Int, allowedUppercase: String, allowedLowercase: String, fallback: ContiguousScript? = nil) {
		self.A = A
		self.a = a
		self.allowedUppercase = allowedUppercase
		self.allowedLowercase = allowedLowercase
		self.fallback = fallback
	}
	
	func convertCharacter(_ char: Character) -> Character {
		// convert to script letters
		var c = char
		if self.allowedUppercase.contains(c) {
			c = Character(UnicodeScalar(Int(c.asciiValue!) + (self.A - ContiguousScript.A))!)
		} else if (self.fallback?.allowedUppercase.contains(c) ?? false) {
			c = Character(UnicodeScalar(Int(c.asciiValue!) + (self.fallback!.A - ContiguousScript.A))!)
		}
		if self.allowedLowercase.contains(c) {
			c = Character(UnicodeScalar(Int(c.asciiValue!) + (self.a - ContiguousScript.a))!)
		} else if (self.fallback?.allowedLowercase.contains(c) ?? false) {
			c = Character(UnicodeScalar(Int(c.asciiValue!) + (self.fallback!.a - ContiguousScript.a))!)
		}
		return c
	}
	
}
