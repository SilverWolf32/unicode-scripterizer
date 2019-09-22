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
// this has to be a reference type (i.e. a class), otherwise it couldn't contain a reference to itself
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
