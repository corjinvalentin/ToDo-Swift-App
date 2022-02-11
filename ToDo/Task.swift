//
//  Task.swift
//  ToDo
//
//  Created by Corjin Valentin on 05.02.2022.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var task = ""
    @Persisted var completed = false
}
