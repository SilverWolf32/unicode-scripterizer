#!/usr/bin/env swift

import Foundation

let 𝐴 = 0x1d434
let 𝑎 = 0x1d44e

let 𝕬 = 0x1d56c
let 𝖆 = 0x1d586

let A = 0x41
let a = 0x61

var blackletter = false

if CommandLine.arguments.contains("-b") {
	blackletter = true
}

let new_A = (blackletter) ? 𝕬 : 𝐴
let new_a = (blackletter) ? 𝖆 : 𝑎

let fh = FileHandle.standardInput

while (true) {
	let data = fh.availableData
	if data.count == 0 { // returns empty on EOF
		break
	}
	var str = String(data: data, encoding: .utf8)!
	str = String(str.map { (c) in
		// convert to script letters
		if "ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(c) {
			// it's a letter
			return Character(UnicodeScalar(Int(c.asciiValue!) + (new_A - A))!)
		}
		// note the absence of lowercase h, it's either not there or someplace else
		if "abcdefgijklmnopqrstuvwxyz".contains(c) {
			// it's a letter
			return Character(UnicodeScalar(Int(c.asciiValue!) + (new_a - a))!)
		}
		return c
	})
	print("\(str)", terminator: "")
}

