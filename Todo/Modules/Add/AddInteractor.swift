//
//  AddInteractor.swift
//  Todo
//
//  Created by Matteo Manferdini on 09/01/26.
//

import Foundation

@Observable class AddInteractor {
	let dataStore: DataStore
	var name: String = ""
	var date: Date = Date()

	init(dataStore: DataStore) {
		self.dataStore = dataStore
	}

	func save() {
		let newItem = TodoItem(name: name, date: date)
		dataStore.save(newItem)
	}
}
