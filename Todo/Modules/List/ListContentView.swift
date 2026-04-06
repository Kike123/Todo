//
//  ListContentView.swift
//  Todo
//
//  Created by Matteo Manferdini on 12/01/26.
//

import SwiftUI

struct ListContentView: View {
    let todayItems: [TodoItem]
    let Upcoming: [TodoItem]
    let nextWeekItems: [TodoItem]
    let addAction: () -> Void

    var body: some View {
        List {
            Section("Today") {
                ForEach(todayItems) { item in
                    Label(item.name, systemImage: "checkmark")
                }
            }
            Section("Upcoming"){
                ForEach(Upcoming){items in
                    Label(items.name, systemImage: "checkmark")
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
            Upcoming: .Upcoming,
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
        TodoItem(name: "Grab coffee", date: Date(timeIntervalSince1970: 1773238428))
    ]

    static let Upcoming: [TodoItem] = [
        TodoItem(name: "Kal ka kaam", date: Date(timeIntervalSince1970: 1773324828)),
        TodoItem(name: "parso ka kaam", date: Date(timeIntervalSince1970: 1773411228)),
        TodoItem(name: "narso ka kaam", date: Date(timeIntervalSince1970: 1773497628)),
        TodoItem(name: "Sat ka kaam", date: Date(timeIntervalSince1970: 1773584028))
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
