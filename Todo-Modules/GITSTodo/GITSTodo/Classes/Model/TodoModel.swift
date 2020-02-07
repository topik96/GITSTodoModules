//
//  TodoModel.swift
//  GITSTodo
//
//  Created by topik mujianto on 07/02/20.
//  Copyright © 2020 topik mujianto. All rights reserved.
//

import Foundation

@objc public class TodoModel: NSObject, Codable {
    public var id: Int?
    public var userId: Int?
    public var title: String?
    public var completed: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title
        case completed
        
    }

    public required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        userId = try? container.decode(Int.self, forKey: .userId)
        title = try? container.decode(String.self, forKey: .title)
        completed = try container.decode(Bool.self, forKey: .completed)
    }

    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
