class BootStrap {

     def init = { servletContext ->
		println(".... BootStrap.init called")
		def jb = new Artist(name:'Jeff Beck')
		
		def lbl = new Label(name:'Some Label', city:'Los Angeles')
		
		def bbb = new Album(title:'Blow By Blow', label: lbl)
		
		jb.addToAlbums(bbb)

		lbl.save()
				
		bbb.addToTracks(name:'Freeway Jam')
		bbb.addToTracks(name:'Thelonius')
		bbb.addToTracks(name:'Cause We Ended As Lovers')

		jb.save()
     }

     def destroy = {
     }
} 
