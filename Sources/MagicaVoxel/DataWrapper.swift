import Foundation

/// A simple wrapper around the Data object to help read in various data types and iterate through the underlying data.
final class DataWrapper {
  private var data: Data!
  private var index: Int = 0

  func load(_ url: URL) -> Bool {
    guard let handle = try? FileHandle(forReadingFrom: url) else {
      return false
    }

    data = handle.readDataToEndOfFile()
    return true
  }

  func eof() -> Bool {
    return data == nil || index >= data.count
  }

  func skip(_ n: Int) {
    index += n
  }

  func readString(length: Int) -> String? {
    let str = String(bytes: data![index..<index+length], encoding: .utf8)
    index += length
    return str
  }

  func readUInt8() -> UInt8 {
    var val: UInt8 = 0
    _ = withUnsafeMutableBytes(of: &val) {
      data.copyBytes(to: $0, from: index..<index+1)
    }
    index += 1
    return val
  }

  func readUInt32() -> UInt32 {
    // We need to make sure we can handle unaligned data importing, which
    // the copyBytes allows for.
    var val: UInt32 = 0
    _ = withUnsafeMutableBytes(of: &val) {
      data.copyBytes(to: $0, from: Int(index)..<Int(index)+4)
    }
    index += 4
    return val
  }

}
