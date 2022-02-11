//
//  TasksView.swift
//  ToDo
//
//  Created by Corjin Valentin on 11.02.2022.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManeger: RealmManager
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                            .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                            .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                        ], center: .top, startRadius: 200, endRadius: 400)
                            .ignoresSafeArea()
            VStack {
                Text("My tasks")
                    .font(.title3).bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                List {
                    ForEach(realmManeger.tasks, id: \.id) { task in
                        if !task.isInvalidated {
                            TaskRow(task: task.task, completed: task.completed)
                                .onTapGesture {
                                    realmManeger.updateTask(id: task.id, completed: !task.completed)
                                }
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        realmManeger.deleteTask(id: task.id)
                                    } label : {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                    .listRowBackground(Color.gray
                                        .opacity(0.2)
                    )
                    .listRowSeparator(.automatic)
                }
                .onAppear{
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
