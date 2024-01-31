package libraryapp

class UrlMappings {

    static mappings = {
                        
        //url mapping : 
        "/$controller/$action?/$id?" {
            constraints { }
        }

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/user/home")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
