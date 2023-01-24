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
        
        var signatureIn = secp256k1_ecdsa_signature()
        var signatureOut = secp256k1_ecdsa_signature()
        secp256k1_ecdsa_signature_parse_compact(secp256k1.Context.raw, &signatureIn, signature)
        secp256k1_ecdsa_signature_normalize(secp256k1.Context.raw, &signatureOut, &signatureIn)
        
        guard let normalizedSignature = try? secp256k1.Signing.ECDSASignature(rawRepresentation: signatureOut.dataValue) else {
            throw JOSESwiftError.signatureInvalid
        }

        return secp256k1PublicKey.ecdsa.isValidSignature(normalizedSignature, for: verifyingInput)
    }
}



