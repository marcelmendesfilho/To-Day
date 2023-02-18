//
//  EditGroup.swift
//  To-Day
//
//  Created by Sarah Reichelt on 18/2/2023.
//

import SwiftUI

struct EditGroup: View {
  @ObservedObject var appState: AppState
  @Environment(\.openWindow) private var openWindow

  var body: some View {
    Group {
      Divider()

      Button("Edit Todos…") {
        openWindow(id: "edit_todos")
        NSApp.activate(ignoringOtherApps: true)
      }

      Button("Mark All Complete") {
        appState.markAll(complete: true)
      }
      .disabled(appState.allComplete)

      Button("Mark All Incomplete") {
        appState.markAll(complete: false)
      }
      .disabled(appState.allIncomplete)
    }
  }
}

struct EditGroup_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      EditGroup(appState: AppState())
    }
  }
}
