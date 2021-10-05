import Foundation

public struct MultiSet<T:Hashable>: Equatable
{
	private var dict : [T: UInt] = [:]
	
	public init() {}
	
	public init<C: Collection>(_ collection: C) where C.Element == T {
		for element in collection {
		  self.insert(element)
		}
	  }
	
	public mutating func insert(_ value: T)
	{
		dict[value,default: 0] += 1
	}
	
	public mutating func remove(_ value: T) {
		guard let storedValue = dict[value] else {
			return
		}
		if storedValue == 1 {
			dict[value] = nil
		} else {
			dict[value] = storedValue - 1
		}
	}
	
	public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.dict == rhs.dict
	}
}

// MARK: - ExpressibleByArrayLiteral
extension MultiSet: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: T...) {
	self.init(elements)
  }
}
