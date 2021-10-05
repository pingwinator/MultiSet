import XCTest
@testable import MultiSet

final class MultiSetTests: XCTestCase {
    func testEqual() throws {
		var set = MultiSet<Int>()
		set.insert(1)
		set.insert(3)
		set.insert(1)
		set.insert(2)
		set.insert(3)
		set.insert(1)
		set.remove(3)
		set.remove(3)

		var set2 = MultiSet<Int>()
		set2.insert(2)
		set2.insert(1)
		set2.insert(1)
		set2.insert(1)
		set2.remove(5)
        XCTAssertEqual(set, set2)
    }
	
	func testArrayLiteral() throws {
		var set = MultiSet<Int>()
		set.insert(2)
		set.insert(1)
		set.insert(1)
		set.insert(1)

		let setLiteral: MultiSet = [2,1,1,1]
		XCTAssertEqual(setLiteral, set)
	}
}
