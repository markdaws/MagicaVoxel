import Foundation

public struct Voxel {
  public let pos: SIMD3<UInt8>
  public var r: UInt8
  public var g: UInt8
  public var b: UInt8

  let colorIndex: UInt8
}
