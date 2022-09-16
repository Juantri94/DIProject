//
//  BridgeConnections.swift
//  DIProject
//
//  Created by Juantri Jimenez on 20/7/22.
//

import Environment
import Bridge

final class BridgeConnections {

    let environment: AppEnvironment
    
    init(
        appEnvironment: AppEnvironment
    ) {
        self.environment = appEnvironment
        
        Bridge.setUp(
            featureA: self.featureA,
            featureB: self.featureB,
            featureC: self.featureC)
    }

}
