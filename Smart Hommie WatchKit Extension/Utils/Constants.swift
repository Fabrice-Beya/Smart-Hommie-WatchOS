//
//  Constants.swift
//  Smart Hommie WatchKit Extension
//
//  Created by Fabrice Beya on 2021/05/03.
//

import Firebase

let DB_REF = Database.database().reference()
let REF_LIVING_ROOM = DB_REF.child("Living Room")
let REF_MAIN_BEDROOM = DB_REF.child("Main Bedroom")
let REF_BATHROOM = DB_REF.child("Bathroom")
let REF_OFFICE_SPACE = DB_REF.child("Office Space")

