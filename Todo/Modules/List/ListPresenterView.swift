//
//  ContentView.swift
//  Todo
//
//  Created by Matteo Manferdini on 08/01/26.
//

import SwiftUI
import SwiftData
import Playgrounds

struct ListPresenterView: View {
	@State var interactor: ListInteractor
	@State var wireframe: ListWireframe

	var body: some View {
		ListContentView(
			todayItems: interactor.todayItems,
			nextWeekItems: interactor.nextWeekItems,
			addAction: { wireframe.presentAddInterface() }
		)
		.onAppear { interactor.findUpcomingItems() }
		.onChange(of: wireframe.isAddInterfacePresented) {
			interactor.findUpcomingItems()
		}
	}
}
