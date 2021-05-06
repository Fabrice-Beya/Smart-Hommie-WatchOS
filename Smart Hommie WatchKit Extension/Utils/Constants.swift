//
//  Constants.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import Firebase

let DB_REF = Database.database().reference()

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

