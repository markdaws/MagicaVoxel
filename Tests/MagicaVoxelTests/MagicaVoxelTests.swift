import XCTest
@testable import MagicaVoxel

final class MagicaVoxelTests: XCTestCase {

  /// Make sure a larger file loads in a reasonable time.
  /// We don't actually impose an upper bound here, I just print out the timing information to make sure
  /// it is in the range I expect it to be.
  func testPerf() {
    let importer = Importer()
    let voxResource = resourceUrl("resources/treehouse.vox")

    importer.debugVerbose = true
    guard let result = importer.load(url: voxResource) else {
      XCTFail("Failed to load test file")
      return
    }

    XCTAssertEqual(result.x, 126)
    XCTAssertEqual(result.y, 126)
    XCTAssertEqual(result.z, 126)
    XCTAssertEqual(result.voxels.count, 117429)
  }

  func testEmpty() {
    let importer = Importer()
    let voxResource = resourceUrl("resources/empty.vox")

    guard let result = importer.load(url: voxResource) else {
      XCTFail("Failed to load test file")
      return
    }

    XCTAssertEqual(result.x, 10)
    XCTAssertEqual(result.y, 20)
    XCTAssertEqual(result.z, 30)
    XCTAssertEqual(result.voxels.count, 0)
  }

  private func resourceUrl(_ component: String) -> URL {
    // TODO: Once Swift PM supports resources we can get rid of this hack
    let thisFile = URL(fileURLWithPath: #file)
    let thisDirectory = thisFile.deletingLastPathComponent()
    return thisDirectory.appendingPathComponent(component)
  }

  static var allTests = [
      ("testPerf", testPerf),
      ("testEmpty", testEmpty)
  ]
}
