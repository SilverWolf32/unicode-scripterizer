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
	static let script = ContiguousScript(
		A: 0x1d434,
		a: 0x1d44e,
		allowedUppercase: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
		allowedLowercase: "abcdefgijklmnopqrstuvwxyz",
		fallback: nil
	)
	// missing several capital letters
	static let blackletterLight = ContiguousScript(
		A: 0x1d504,
		a: 0x1d51e,
		allowedUppercase: "ABDEFGJKLMNOPQSTUVWXY",
		allowedLowercase: "abcdefghijklmnopqrstuvwxyz",
		fallback: ScriptSelection.blackletterBold
	)
	// all letters!
	static let blackletterBold = ContiguousScript(
		A: 0x1d56c,
		a: 0x1d586,
		allowedUppercase:"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
		allowedLowercase: "abcdefghijklmnopqrstuvwxyz",
		fallback: nil
	)
	// all letters, but only one case - information lost!
	static let runes = RuneScript(
		from: "abcdefghijklmnopqrstuvwxyz",
		to:   "ᚨᛒᚲᛞᛖᚠᚷᚺᛁᛃᚴᛚᛗᚾᛟᛈᛩᚱᛊᛏᚢᚡᚹᛪᛦᛎ",
		fallback: nil
	)!
	// see https://git.sr.ht/~alva/icelandic-runes
	static let icelandicRunes = TRScript(
		from: "aåábcdðeéfghiíjklmnoópqrstuúvwxyýzþäæöAÅÁBCDÐEÉFGHIÍJKLMNOÓPQRSTUÚVWXYÝZÞÄÆÖ",
		to:   "ᛆᚨᚨᛒᛍᛑᚧᛂᛖᚠᚵᚼᛁᛇᛃᚴᛚᛘᚿᚮᛟᛔᛩᚱᛋᛐᚢᚤᚡᚥᛪᛦᛨᛎᚦᛅᛅᚯᛆᚨᚨᛒᛍᛑᚧᛂᛖᚠᚵᚼᛁᛇᛃᚴᛚᛘᚿᚮᛟᛔᛩᚱᛋᛐᚢᚤᚡᚥᛪᛦᛨᛎᚦᛅᛅᚯ",
		fallback: nil
	)!
	// missing Q (well, it's there, but not in fonts) and X
	static let smallCaps = TRScript(
		from: "abcdefghijklmnoprstuvwyz",
		to: "ᴀʙᴄᴅᴇꜰɢʜɪᴊᴋʟᴍɴᴏᴘʀꜱᴛᴜᴠᴡʏᴢ",
		fallback: nil
	)!
}
