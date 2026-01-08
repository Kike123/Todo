//
//  Dependencies.swift
//  Todo
//
//  Created by Matteo Manferdini on 09/01/26.
//

import Foundation
import SwiftData
import SwiftUI

@Observable class Dependencies {
	let modelContainer: ModelContainer
	let dataStore: DataStore
	let rootWireframe: ListWireframe

	init() {
		let schema = Schema([TodoItem.self])
		let configuration = ModelConfiguration(
			schema: schema,
			isStoredInMemoryOnly: false
		)
		let container = try! ModelContainer(
			for: schema,
			configurations: [configuration]
		)
		modelContainer = container
		dataStore = DataStore(modelContext: container.mainContext)
		rootWireframe = Self.setDependencies(dataStore: dataStore)
	}

	var rootInterface: some View {
		rootWireframe.interface
	}

	static func setDependencies(dataStore: DataStore) -> ListWireframe {
		let listInteractor = ListInteractor(dataStore: dataStore)
		let addInteractor = AddInteractor(dataStore: dataStore)
		let addWireframe = AddWireframe(interactor: addInteractor)
		let listWireframe = ListWireframe(
			listInteractor: listInteractor,
			addWireframe: addWireframe
		)
		addWireframe.delegate = listWireframe
		return listWireframe
	}
}
