//
//  User.swift
//  aboutMe
//
//  Created by  Vadim Tatarchuk on 26.10.2020.
//  Copyright © 2020  Vadim Tatarchuk. All rights reserved.
//

struct User {
    let username: String
    let password: String
    let description: String
    let age: Int
    let fullName: String
}

extension User {
    static func getUser() -> User {
        return User(
            username: "vadim",
            password: "123456",
            description: "Программист, закончил универ, основное направление front-end разработка. Но в последнее время решил перепрофелироваться на iOS разработку в связи с необходимостью компании. Люблю бегать и плавать в бассейне :) Путешествую и часто отдыхаю на природе.",
            age: 32,
            fullName: "Vadim Tatarchuk"
        )
    }
}
