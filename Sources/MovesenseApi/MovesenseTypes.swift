//
//  MovesenseTypes.swift
//  MovesenseApi
//
//  Copyright © 2023 Canned Bit Ltd. All rights reserved.
//  Copyright © 2019 Movesense. All rights reserved.
//

public typealias MovesenseSerialNumber = String

public enum MovesenseMethod: String, Codable {
    case get = "GET"
    case put = "PUT"
    case del = "DEL"
    case post = "POST"
    case subscribe
    case unsubscribe
}

public enum MovesenseError: Error {
    case integrityError(String)
    case controllerError(String)
    case decodingError(String)
    case requestError(String)
    case deviceError(String)
}

public enum MovesenseResponseCode: Int, Codable {
    case unknown = 0
    case ok = 200
    case created = 201
    case badRequest = 400
    case notFound = 404
    case conflict = 409
}

public struct MovesenseAddressInfo: Codable {

    public let address: String
    public let name: String

    public init(address: String, name: String) {
        self.address = address
        self.name = name
    }
}

public struct MovesenseInfo: Codable {

    public let manufacturerName: String
    public let brandName: String?
    public let productName: String
    public let variantName: String
    public let design: String?
    public let hwCompatibilityId: String
    public let serialNumber: String
    public let pcbaSerial: String
    public let swVersion: String
    public let hwVersion: String
    public let additionalVersionInfo: String?
    public let addressInfo: [MovesenseAddressInfo]
    public let apiLevel: String
}

public struct MovesenseDeviceInfo: Codable {

    public let description: String
    public let mode: Int
    public let name: String
    public let serialNumber: String
    public let swVersion: String
    public let hwVersion: String
    public let hwCompatibilityId: String
    public let manufacturerName: String
    public let pcbaSerial: String
    public let productName: String
    public let variantName: String
    public let addressInfo: [MovesenseAddressInfo]

    public init(description: String, mode: Int, name: String, serialNumber: String, swVersion: String, hwVersion: String, hwCompatibilityId: String, manufacturerName: String, pcbaSerial: String, productName: String, variantName: String, addressInfo: [MovesenseAddressInfo]) {
        self.description = description
        self.mode = mode
        self.name = name
        self.serialNumber = serialNumber
        self.swVersion = swVersion
        self.hwVersion = hwVersion
        self.hwCompatibilityId = hwCompatibilityId
        self.manufacturerName = manufacturerName
        self.pcbaSerial = pcbaSerial
        self.productName = productName
        self.variantName = variantName
        self.addressInfo = addressInfo
    }
}

public struct MovesenseHeartRate: Codable {

    public let average: Float
    public let rrData: [Int]
}

public struct MovesenseAcc: Codable {

    public let timestamp: UInt32
    public let vectors: [MovesenseVector3D]

    public init(timestamp: UInt32, vectors: [MovesenseVector3D]) {
        self.timestamp = timestamp
        self.vectors = vectors
    }
}

public struct MovesenseAccConfig: Codable {

    public let gRange: UInt8

    public init(gRange: UInt8) {
        self.gRange = gRange
    }
}

public struct MovesenseAccInfo: Codable {

    public let sampleRates: [UInt16]
    public let ranges: [UInt8]

    public init(sampleRates: [UInt16], ranges: [UInt8]) {
        self.sampleRates = sampleRates
        self.ranges = ranges
    }
}

public struct MovesenseAppInfo: Codable {

    public let name: String
    public let version: String
    public let company: String

    public init(name: String, version: String, company: String) {
        self.name = name
        self.version = version
        self.company = company
    }
}

public struct MovesenseEcg: Codable {

    public let timestamp: UInt32
    public let samples: [Int32]
}

public struct MovesenseEcgInfo: Codable {

    public let currentSampleRate: UInt16
    public let availableSampleRates: [UInt16]
    public let arraySize: UInt16
}

public struct MovesenseGyro: Codable {

    public let timestamp: UInt32
    public let vectors: [MovesenseVector3D]
}

public struct MovesenseGyroConfig: Codable {

    public let dpsRange: UInt16
}

public struct MovesenseGyroInfo: Codable {

    public let sampleRates: [UInt16]
    public let ranges: [UInt16]
}

public struct MovesenseSystemEnergy: Codable {

    public let percentage: UInt8
    public let milliVolts: UInt16?
    public let internalResistance: UInt8?

    public init(percentage: UInt8, milliVolts: UInt16?, internalResistance: UInt8?) {
        self.percentage = percentage
        self.milliVolts = milliVolts
        self.internalResistance = internalResistance
    }
}

public struct MovesenseSystemMode: Codable {

    let currentMode: UInt8
    let nextMode: UInt8?
}

public struct MovesenseVector3D: Codable {

    public let x: Float
    public let y: Float
    public let z: Float
}
