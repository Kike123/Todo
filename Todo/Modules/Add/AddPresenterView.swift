//
//  SwiftUIView.swift
//  Todo
//
//  Created by Matteo Manferdini on 09/01/26.
//

import SwiftUI

struct AddPresenterView: View {
	@State var interactor: AddInteractor
	@State var wireframe: AddWireframe
	
	var body: some View {
		AddContentView(
			name: $interactor.name,
			date: $interactor.date,
			saveAction: {
				interactor.save()
				wireframe.finish()
			},
			cancelAction: { wireframe.finish() }
		)
	}
}
