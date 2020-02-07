
//
//  TodoWorker.swift
//  GITSTodo
//
//  Created by topik mujianto on 07/02/20.
//  Copyright © 2020 topik mujianto. All rights reserved.
//

import Foundation

@objc public class NetworkManager: NSObject {
    private static let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
    
    @objc public static func getTodos(onSuccess: @escaping([String])->Void, onError: @escaping(String)->Void ){
        let task  = URLSession.shared.dataTask(with: url!, completionHandler: {data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error with fetching films: \(error)")
                    onError(error.localizedDescription)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    onError(String(describing: response))
                    return
                }
                
                if let data = data, let todos = try? JSONDecoder().decode([TodoModel].self, from: data) {
                    let todosTitle: [String] = todos.map { ($0.title ?? "") }
                    onSuccess(todosTitle)
                }
            }
        })
        task.resume()
    }
}
