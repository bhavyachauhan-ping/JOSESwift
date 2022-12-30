//
//  Secp256k1Verifier.swift
//  JOSESwift
//
//  Created by Bhavya Chauhan on 12/30/22.
//


import Foundation
import secp256k1

internal struct Secp256k1Verifier: VerifierProtocol {

    typealias KeyType = Data
    
    let algorithm: SignatureAlgorithm
    let publicKey: KeyType

    func verify(_ verifyingInput: Data, against signature: Data) throws -> Bool {
        let secp256k1PublicKey = try secp256k1.Signing.PublicKey(rawRepresentation: self.publicKey, format: .uncompressed)
        let ecdsaSignature = try secp256k1.Signing.ECDSASignature(rawRepresentation: signature)
        return secp256k1PublicKey.ecdsa.isValidSignature(ecdsaSignature, for: verifyingInput)

    }
}



