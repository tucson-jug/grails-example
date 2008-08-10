class Album {
	String title
	Label label 
		
	static hasMany = [tracks: Track]
	static belongsTo = [artist: Artist]

	static constraints = {
		label(nullable: true)
	}	
	String toString() {
		title
	}
}
