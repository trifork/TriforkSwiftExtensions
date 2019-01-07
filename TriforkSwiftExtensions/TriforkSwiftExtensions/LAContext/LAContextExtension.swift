//
//  LAContextExtension.swift
//  TriforkSwiftExtensions
//
//  Created by Thomas Kalhøj Clemensen on 06/09/2018.
//  Copyright © 2018 Trifork A/S. All rights reserved.
//

import Foundation
import LocalAuthentication

public extension LAContext {
    public enum BiometricType: String {
        case none
        case touchID
        case faceID
        
        public func name() -> String {
            let title: String
            
            switch self {
            case .touchID:
                title = "TouchID"
            case .faceID:
                title = "FaceID"
            default:
                title = ""
            }
            
            return title
        }
    }
    
    public static var biometricType: BiometricType {
        var error: NSError?
        let context: LAContext = LAContext()
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }
        
        if #available(iOS 11.0, *) {
            switch context.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            }
        } else {
            return  context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
        }
    }

}
