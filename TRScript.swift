class TRScript: Script {
	
	let from: String
	let to: String
	let fallback: Script?
	
	init?(from: String, to: String, fallback: Script?) {
		if (from.count != to.count) {
			return nil
		}
		self.from = from
		self.to = to
		self.fallback = fallback
	}
	
	func convert(_ str: String) -> String {
		var newStr = String()
		newStr.reserveCapacity(str.count)
		for char in str {
			var n = String(convertCharacter(char))
			if fallback != nil && n == String(char) {
				n = fallback!.convert(n)
			}
			newStr.append(n)
		}
		return newStr
	}
	
	func convertCharacter(_ c: Character) -> Character {
		for (index, fromC) in from.enumerated() {
			if c == fromC {
				return to[to.index(to.startIndex, offsetBy: index)]
			}
		}
		return c
	}
	
}
