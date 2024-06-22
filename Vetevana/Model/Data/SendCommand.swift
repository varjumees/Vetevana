//
//
//  SendCommand.swift
//
//
//  Created by varjumees on 22.06.2024.
//  Copyright © 2024 varjumees. All rights reserved.
//
//

import Foundation

func SendCommand(modelIdentifier: String) -> String? {
    let process = Process()
    process.launchPath = Bundle.main.path(forResource: "macserial", ofType: nil)
    process.arguments = ["--model", modelIdentifier, "--num", "1"]

    let outputPipe = Pipe()
    process.standardOutput = outputPipe
    process.launch()

    let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
    var outputString = String(data: outputData, encoding: .utf8)

    process.waitUntilExit()

    if let hardwareSerial = extractHardwareSerial(serialString: outputString) {
        outputString = hardwareSerial
    }

    return outputString
}

func extractHardwareSerial(serialString: String?) -> String? {
    guard let serialString = serialString else {
        return nil
    }
    // Split the string into lines
    let lines = serialString.components(separatedBy: .newlines)
    // Process each line to extract the serial number before the " | " delimiter
    let serials = lines.map { line -> String in
        let components = line.components(separatedBy: "|")
        return components.first?.trimmingCharacters(in: .whitespaces) ?? ""
    }
    // Join the processed serial numbers with newline characters
    return serials.joined(separator: "\n")
}


