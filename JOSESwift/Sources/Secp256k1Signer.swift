//
//  Secp256k1Signer.swift
//  JOSESwift
//
//  Created by Bhavya Chauhan on 12/30/22.
//

import Foundation
import libsecp256k1

internal struct Secp256k1Signer: SignerProtocol {

    typealias KeyType = Data
    
    let algorithm: SignatureAlgorithm
    let privateKey: KeyType
    
    func sign(_ signingInput: Data) throws -> Data {
        let secp256k1PrivateKey = try secp256k1.Signing.PrivateKey(rawRepresentation: self.privateKey, format: .uncompressed)
        return try secp256k1PrivateKey.ecdsa.signature(for: signingInput).compactRepresentation

    }
}

