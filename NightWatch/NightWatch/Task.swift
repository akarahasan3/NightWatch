//
//  Task.swift
//  NightWatch
//
//  Created by Ajdin Karahasanovic on 14.07.23.
//

import Foundation

struct Task : Identifiable{
    var id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
