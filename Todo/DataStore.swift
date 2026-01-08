//
//  DataStore.swift
//  Todo
//
//  Created by Matteo Manferdini on 08/01/26.
//

import Foundation
import SwiftData

@Observable class DataStore {
	let modelContext: ModelContext

	init(modelContext: ModelContext) {
		self.modelContext = modelContext
	}

	func todoItems(between start: Date, and end: Date) -> [TodoItem] {
		let items = try? modelContext.fetch(
			FetchDescriptor(
				predicate: #Predicate<TodoItem> { $0.date > start && $0.date < end },
				sortBy: [SortDescriptor(\.date)]
			)
		)
		return items ?? []
	}

	func save(_ item: TodoItem) {
		modelContext.insert(item)
		try! modelContext.save()
	}
}
