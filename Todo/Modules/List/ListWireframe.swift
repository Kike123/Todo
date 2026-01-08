//
//  ListWireframe.swift
//  Todo
//
//  Created by Matteo Manferdini on 12/01/26.
//

import Foundation
import SwiftUI

@Observable class ListWireframe {
	let listInteractor: ListInteractor
	let addWireframe: AddWireframe
	private(set) var isAddInterfacePresented = false

	init(listInteractor: ListInteractor, addWireframe: AddWireframe) {
		self.listInteractor = listInteractor
		self.addWireframe = addWireframe
	}

	var interface: some View {
		@Bindable var wireframe = self
		return NavigationStack {
			ListPresenterView(interactor: listInteractor, wireframe: self)
				.fullScreenCover(isPresented: $wireframe.isAddInterfacePresented) {
					self.addWireframe.interface
				}
		}
	}

	func presentAddInterface() {
		isAddInterfacePresented = true
	}
}

extension ListWireframe: AddDelegate {
	func addModuleDidFinish() {
		isAddInterfacePresented = false
	}
}
