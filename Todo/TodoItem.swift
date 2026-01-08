//
//  TodoItem.swift
//  Todo
//
//  Created by Matteo Manferdini on 08/01/26.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
	var name: String
	var date: Date

	init(name: String, date: Date) {
		self.name = name
		self.date = date
	}
}
