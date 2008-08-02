class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
	
	  "/showArtist/$artistName" {
		controller = 'artist'
		action = 'showTheArtist'
      }

	  "500"(view:'/error')
	}
}
