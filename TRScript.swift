class TRScript: Script {
	
	let from: String
	let to: String
	let fallback: TRScript?
	
	init?(from: String, to: String, fallback: TRScript?) {
		if (from.count != to.count) {
			return nil
		}
		self.from = from
		self.to = to
		self.fallback = fallback
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
