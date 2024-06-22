//
//
// SeededRandomGenerator.swift
//
//
// Created by varjumees on 04.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import Foundation

public struct SeededRandomGenerator: RandomNumberGenerator {
    public init(seed: Int) {
        srand48(seed)
    }
    
    public func next() -> UInt64 {
        UInt64(drand48() * 0x1.0p64) ^ UInt64(drand48() * 0x1.0p16)
    }
}
