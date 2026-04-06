//
//  ListInteractor.swift
//  Todo
//
//  Created by Matteo Manferdini on 08/01/26.
//

import Foundation

@Observable class ListInteractor {
    let dataStore: DataStore
    private(set) var todayItems: [TodoItem] = []
    private(set) var upcomingItems: [TodoItem] = []
    private(set) var nextWeekItems: [TodoItem] = []
    

    init(dataStore: DataStore) {
        self.dataStore = dataStore
    }

    func findUpcomingItems() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.startOfDay(
            for: calendar.date(byAdding: .day, value: 1, to: today)!
        )
        
        if let lastDayOfTheCurrentWeek = calendar.nextWeekend(startingAfter: today)?.start {
            let currentWeekToDos = dataStore.todoItems(between: tomorrow, and: lastDayOfTheCurrentWeek)
            upcomingItems = currentWeekToDos
        }
        
        todayItems = dataStore.todoItems(between: today, and: tomorrow)
        let nextWeek = calendar.date(byAdding: .day, value: 7, to: today)!
        let endOfNextWeek = calendar.nextWeekend(startingAfter: nextWeek)!.end
        nextWeekItems = dataStore.todoItems(between: nextWeek, and: endOfNextWeek)
    }
}
