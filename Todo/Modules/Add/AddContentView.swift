//
//  AddContentView.swift
//  Todo
//
//  Created by Matteo Manferdini on 12/01/26.
//

import SwiftUI

struct AddContentView: View {
	@Binding var name: String
	@Binding var date: Date
	let saveAction: () -> Void
	let cancelAction: () -> Void

	var body: some View {
		Form {
			TextField("Name", text: $name)
			DatePicker("Date", selection: $date)
				.datePickerStyle(.graphical)
		}
		.navigationTitle("Add todo")
		.toolbar {
			ToolbarItem {
				Button("Save", role: .confirm, action: saveAction)
			}
			ToolbarItem(placement: .cancellationAction) {
				Button("Cancel", role: .cancel, action: cancelAction)
			}
		}
	}
}

#Preview {
	@Previewable @State var name: String = ""
	@Previewable @State var date: Date = Date()
	NavigationStack {
		AddContentView(
			name: $name,
			date: $date,
			saveAction: {},
			cancelAction: {})
	}
}
