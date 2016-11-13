import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("/hello", ":name") { request in
    if let name = request.parameters["name"]?.string {
        return "Hello \(name)"
    }
    throw Abort.badRequest
}

drop.resource("posts", PostController())

drop.run()

