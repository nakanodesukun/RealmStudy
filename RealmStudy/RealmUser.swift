//
//  RealmUser.swift
//  RealmStudy
//
//  Created by 中野翔太 on 2022/01/14.
//

import RealmSwift

class User: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
