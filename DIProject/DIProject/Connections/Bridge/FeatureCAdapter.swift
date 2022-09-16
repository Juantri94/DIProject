//
//  FeatureCAdapter.swift
//  DIProject
//
//  Created by Juantri Jimenez on 22/7/22.
//

import Foundation
import FeatureC
import Environment
import Bridge

extension BridgeConnections {
    
    var featureC: FeatureCProtocol {
        FeatureCEntryPoint()
    }
    
}
