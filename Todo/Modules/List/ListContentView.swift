//
//  ListContentView.swift
//  Todo
//
//  Created by Matteo Manferdini on 12/01/26.
//

import SwiftUI

struct ListContentView: View {
	let todayItems: [TodoItem]
	let nextWeekItems: [TodoItem]
	let addAction: () -> Void

	var body: some View {
		List {
			Section("Today") {
				ForEach(todayItems) { item in
					Label(item.name, systemImage: "checkmark")
				}
			}
			Section("Next week") {
				ForEach(nextWeekItems) { item in
					Label(item.name, systemImage: "calendar")
						.badge(Text(item.weekday))
				}
			}
		}
		.navigationTitle("Todo")
		.toolbar {
			Button("", systemImage: "plus", action: addAction)
		}
	}
}

#Preview {
	NavigationStack {
		ListContentView(
			todayItems: .today,
			nextWeekItems: .nextWeek,
			addAction: {
			})
	}
}

extension TodoItem {
	var weekday: String {
		let calendar = Calendar.current
		return calendar.weekdaySymbols[calendar
			.component(.weekday, from: date) - calendar.firstWeekday + 1]
	}
}

extension [TodoItem] {
	static let today: [TodoItem] = [
		TodoItem(name: "Grab coffee", date: Date())
	]

	static let nextWeek: [TodoItem] = [
		TodoItem(
			name: "Stock up on water",
			date: Calendar.current.date(byAdding: .day, value: 7, to: Date())!
		),
		TodoItem(
			name: "Visit labs",
			date: Calendar.current.date(byAdding: .day, value: 8, to: Date())!
		),
		TodoItem(
			name: "Fly home",
			date: Calendar.current.date(byAdding: .day, value: 9, to: Date())!
		)
	]
}
