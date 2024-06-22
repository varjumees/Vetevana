//
//
// File.swift
// 
//
// Created by varjumees on 05.06.2024
// Copyright © 2024 varjumees. All rights reserved.
//
        

import Foundation
import Observation

public struct Step: Identifiable, Codable {
    public var id: String { title }
    public var title: String
    public var instruction: String
    public var image: String
    public var isCompleted: Bool = false
}
