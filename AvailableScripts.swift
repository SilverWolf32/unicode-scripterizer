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
	static let fancyScript = TRScript(
		from: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
		to:   "𝒜ℬ𝒞𝒟ℰℱ𝒢ℋℐ𝒥𝒦ℒℳ𝒩𝒪𝒫𝒬ℛ𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵𝒶𝒷𝒸𝒹ℯ𝒻ℊ𝒽𝒾𝒿𝓀𝓁𝓂𝓃ℴ𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏",
		fallback: nil
	)!
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
		to:   "ᚨᛒᚲᛞᛖᚠᚷᚺᛁᛃᚴᛚᛗᚾᛟᛈᛩᚱᛊᛏᚢᚢᚹᛪᛦᛎ",
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
	// has ∑!
	static let doublestruck = TRScript(
		from: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzπΠγΓ∑",
		to: "𝔸𝔹ℂ𝔻𝔼𝔽𝔾ℍ𝕀𝕁𝕂𝕃𝕄ℕ𝕆ℙℚℝ𝕊𝕋𝕌𝕍𝕎𝕏𝕐ℤ𝕒𝕓𝕔𝕕𝕖𝕗𝕘𝕙𝕚𝕛𝕜𝕝𝕞𝕟𝕠𝕡𝕢𝕣𝕤𝕥𝕦𝕧𝕨𝕩𝕪𝕫ℼℿℽℾ⅀",
		fallback: nil
	)!
}
