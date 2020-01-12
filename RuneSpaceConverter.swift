class RuneSpaceConverter: Script {
	
	enum SpacingMode {
		case normal
		case spaced
	}
	
	var mode: SpacingMode = .normal
	
	func convert(_ str: String) -> String {
		var newStr = String()
		newStr.reserveCapacity(str.count)
		for char in str {
			newStr.append(convertSpace(char))
		}
		return newStr
	}
	
	func convertSpace(_ c: Character) -> String {
		if c == " " {
			switch mode {
				case .normal:
					return "᛫​"
				case .spaced:
					return " ᛫ "
			}
		}
		return String(c)
	}
	
}
