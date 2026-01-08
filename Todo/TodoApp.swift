//
//  TodoApp.swift
//  Todo
//
//  Created by Matteo Manferdini on 08/01/26.
//

import SwiftUI
import SwiftData

@main
struct TodoApp: App {
	@State private var dependencies = Dependencies()

	var body: some Scene {
		WindowGroup {
			dependencies.rootInterface
		}
	}
}
