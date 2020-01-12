class RuneScript: TRScript {
	
	enum SpacingMode {
		case normal
		case spaced
	}
	
	var spacingMode: SpacingMode = .normal
	
	override func convert(_ str: String) -> String {
		var strWithPreConversions = str
		// th -> ᚦ
		strWithPreConversions = strWithPreConversions.lowercased.replacingOccurrences(of: "th", with: "ᚦ")
		// replace space
		switch spacingMode {
			case .normal:
				// U+200B is zero-width space, for line breaks
				strWithPreConversions = strWithPreConversions.replacingOccurrences(of: " ", with: "᛫​")
			case .spaced:
				strWithPreConversions = strWithPreConversions.replacingOccurrences(of: " ", with: " ᛫ ")
		}
		var newStr = String()
		newStr.reserveCapacity(strWithPreConversions.count)
		for char in strWithPreConversions {
			var n = String(convertCharacter(char))
			if fallback != nil && n == String(char) {
				n = fallback!.convert(n)
			}
			newStr.append(n)
		}
		return newStr
	}
	
}
