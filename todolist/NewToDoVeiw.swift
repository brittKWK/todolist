//
//  NewToDoVeiw.swift
//  todolist
//
//  Created by scholar on 8/2/23.
//

import SwiftUI

struct NewToDoVeiw: View {
    @Environment(\.managedObjectContext) var context
    @State var title: String
    @State var isImportant: Bool
    @Binding var showNewTask : Bool
    var body: some View {
        VStack{
            Text("Task title:")
            TextField("Enter the task description...", text:$title)
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
            }//toggle
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }) {
                Text("Add")
            }
            
            .padding()
        }//vstack
        
    }//someview
    private func addTask(title: String, isImportant: Bool = false) {
            
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
                    try context.save()
        } catch {
            print(error)
        }
        }
}//view

struct NewToDoVeiw_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoVeiw(title: "", isImportant: false,showNewTask: .constant(true))
    }
}
