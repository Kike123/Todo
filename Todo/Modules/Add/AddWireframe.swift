//
//  AddWireframe.swift
//  Todo
//
//  Created by Matteo Manferdini on 12/01/26.
//

import SwiftUI

@Observable class AddWireframe {
	let interactor: AddInteractor
	var delegate: AddDelegate?

	init(interactor: AddInteractor) {
		self.interactor = interactor
	}

	var interface: some View {
		NavigationStack {
			AddPresenterView(interactor: interactor, wireframe: self)
		}
	}

	func finish() {
		delegate?.addModuleDidFinish()
	}
}

protocol AddDelegate {
	func addModuleDidFinish()
}
