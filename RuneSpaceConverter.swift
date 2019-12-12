class RuneSpaceConverter: Script {
	
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
			return " ᛫ "
		}
		return String(c)
	}
	
}
