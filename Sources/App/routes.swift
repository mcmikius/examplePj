import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello"
    }
    
    router.get("user") { (req) in
        return "User"
    }
    
    router.post("programmers") { (req) in
        return "Number one"
    }
    
    router.get("user", String.parameter) { req -> String in
        let user = try req.parameters.next(String.self)
        return "User: \(user)"
    }
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
