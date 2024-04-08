//
//  SplashEndDelegate.swift
//  SplashFeature
//
//  Created by 강현준 on 4/8/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import Foundation
import Core

public protocol SplashFinishDelegate: AnyObject {
    func finish(_ type: SplashEndType)
}
