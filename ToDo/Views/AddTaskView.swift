//
//  AddTaskView.swift
//  ToDo
//
//  Created by Corjin Valentin on 11.02.2022.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManeger: RealmManager
    @State private var task : String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                            .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                            .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                        ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Create a new task")
                    .font(.title3).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Enter your task here", text: $task)
                    .textFieldStyle(.roundedBorder)
                    
                Button {
                    if task != "" {
                        realmManeger.addTask(taskTitle: task)
                    }
                    dismiss()
                } label: {
                    Text("Add task")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Color(red: 0.1, green: 0.2, blue: 0.45))
                        .cornerRadius(30)
                }
            }
            .padding(.top, 40)
            .padding(.horizontal)
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
