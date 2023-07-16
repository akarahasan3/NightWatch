//
//  ContentView.swift
//  NightWatch
//
//  Created by Ajdin Karahasanovic on 14.07.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var nightWatchTasks: NightWatchTasks
    @State private var focusMode = false
    @State private var resetAlertShowing = false
    
    var body: some View {
        NavigationView {
            List{
                Section(header: TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly tasks")){
                    
                    // Key-Pair values of tasks and their respective indexes
                    let taskIndexPairs = Array(zip(nightWatchTasks.nightlyTasks, nightWatchTasks.nightlyTasks.indices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: { //0 - zero is the first element of the tuple, aka the Task, therefore we can make the forEach identifiable by the Task Id
                        task, taskIndex in
                        
                        let tasksWrapper = $nightWatchTasks
                        let tasksBinding = tasksWrapper.nightlyTasks
                        let theTask = tasksBinding[taskIndex]
                        
                        if !focusMode || (focusMode && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTask), label:{ TaskRow(task: task)
                            })
                        }
                        
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
                Section(header: TaskSectionHeader(symbolSystemName: "sunset", headerText: "Weekly tasks")){
                    let taskIndexPairs = Array(zip(nightWatchTasks.weeklyTasks, nightWatchTasks.weeklyTasks.indices))
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndex in
                        
                        let tasksWrapper = $nightWatchTasks
                        let tasksBinding = tasksWrapper.weeklyTasks
                        let theTask = tasksBinding[taskIndex]
                        if !focusMode || (focusMode && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTask), label:{ TaskRow(task: task)
                            })
                        }
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.weeklyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightWatchTasks.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
                Section(header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly tasks")){
                    let taskIndexPairs = Array(zip(nightWatchTasks.monthlyTasks, nightWatchTasks.monthlyTasks.indices))
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndex in
                        
                        let tasksWrapper = $nightWatchTasks
                        let tasksBinding = tasksWrapper.monthlyTasks
                        let theTask = tasksBinding[taskIndex]
                         
                        if !focusMode || (focusMode && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTask), label:{ TaskRow(task: task)
                            })
                        }
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.monthlyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightWatchTasks.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Reset"){
                        resetAlertShowing = true
                    }
                }
                ToolbarItem(placement: .bottomBar){
                    HStack {
                            Spacer()
                            Toggle(isOn: $focusMode) {
                                Text("Focus Mode")
                            }
                            .toggleStyle(.switch)
                            .frame(width: 180, alignment: .center) // Adjust the width as needed
                            
                            Spacer()
                        }
                }
                
            }
        }.alert(isPresented: $resetAlertShowing, content: {
            Alert(title: Text("Reset list"), message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Yes, reset it"), action: {
                let newNightWatchTasks = NightWatchTasks()
                
                // Not bothering with persistency atm
                self.nightWatchTasks.nightlyTasks = newNightWatchTasks.nightlyTasks
                self.nightWatchTasks.weeklyTasks = newNightWatchTasks.weeklyTasks
                self.nightWatchTasks.monthlyTasks = newNightWatchTasks.monthlyTasks
            }))
        })
    }
}

struct TaskSectionHeader: View {
    
    let symbolSystemName: String
    let headerText: String
    
    var body: some View {
        HStack{
            Image(systemName: symbolSystemName)
            Text(headerText)
        }.font(.title3)
    }
}

struct TaskRow: View {
    let task: Task
    var body: some View {
        VStack{
            if task.isComplete {
                HStack{
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundStyle(.gray)
                        .strikethrough()
                }
            } else {
                HStack{
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}

//#Preview {
//    var nightWatchTasks = NightWatchTasks()
//    ContentView(nightWatchTasks: nightWatchTasks)
//}
