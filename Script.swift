//
// Script.swift
// unicode-scripterizer
//
// Created by ArgentWolf on 2019-09-21
//
// This is free and unencumbered software released into the public domain.
// See COPYING.md for more information.
//
// vim:set noet fo=tcqr:
//

// script choices
protocol Script {
	
	func convert(_ str: String) -> String
	
	func convertCharacter(_ char: Character) -> Character
	
}
extension Script {
	
	// default methods
	func convert(_ str: String) -> String {
		var newStr = String()
		newStr.reserveCapacity(str.count)
		for char in str {
			newStr.append(convertCharacter(char))
		}
		return newStr
	}
	func convertCharacter(_ c: Character) -> Character {
		return c
	}
	
}
