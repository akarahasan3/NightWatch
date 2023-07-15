//
//  DetailsView.swift
//  NightWatch
//
//  Created by Ajdin Karahasanovic on 14.07.23.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    var body: some View {
        VStack{
            Text(task.name)
            Text("Something else placeholder")
            Button("Mark Complete"){
                task.isComplete = true
            }
        }
    }
}

#Preview {
    DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isComplete: false)))
}
