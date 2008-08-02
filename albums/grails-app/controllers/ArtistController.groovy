            
class ArtistController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

	def showTheArtist = {
		def name = params.artistName.decodeArtistName()
		def theArtist = Artist.findByName(name)
		if(theArtist) {
			render(view:'show', model:[artist:theArtist])
		} else {
			flash.message = "Could not find artist with name ${name}"
			redirect (action:'list')
		}
	}
	
    def list = {
        if(!params.max) params.max = 10
        [ artistList: Artist.list( params ) ]
    }

    def show = {
        def artist = Artist.get( params.id )

        if(!artist) {
            flash.message = "Artist not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ artist : artist ] }
    }

    def delete = {
        def artist = Artist.get( params.id )
        if(artist) {
            artist.delete()
            flash.message = "Artist ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Artist not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def artist = Artist.get( params.id )

        if(!artist) {
            flash.message = "Artist not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ artist : artist ]
        }
    }

    def update = {
        def artist = Artist.get( params.id )
        if(artist) {
            artist.properties = params
            if(!artist.hasErrors() && artist.save()) {
                flash.message = "Artist ${params.id} updated"
                redirect(action:show,id:artist.id)
            }
            else {
                render(view:'edit',model:[artist:artist])
            }
        }
        else {
            flash.message = "Artist not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def artist = new Artist()
        artist.properties = params
        return ['artist':artist]
    }

    def save = {
        def artist = new Artist(params)
        if(!artist.hasErrors() && artist.save()) {
            flash.message = "Artist ${artist.id} created"
            redirect(action:show,id:artist.id)
        }
        else {
            render(view:'create',model:[artist:artist])
        }
    }
}