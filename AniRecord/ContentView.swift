//
//  ContentView.swift
//  AniRecord
//
//  Created by 장세희 on 2/2/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var records: [Record]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(records) { record in
                    NavigationLink {
                        Text("Item at \(record.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(record.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteRecords)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addRecord) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addRecord() {
        withAnimation {
            let newItem = Record(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteRecords(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(records[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Record.self, inMemory: true)
}
