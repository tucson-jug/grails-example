class BootStrap {

     def init = { servletContext ->
		def jb = new Artist(name:'Jeff Beck')
		
		def bbb = new Album(title:'Blow By Blow')
		
		jb.addToAlbums(bbb)
		
		bbb.addToTracks(name:'Freeway Jam')
		bbb.addToTracks(name:'Thelonius')
		bbb.addToTracks(name:'Cause We Ended As Lovers')

		jb.save()
     }

     def destroy = {
     }
} 