class Album {
	String title
	Label label 
		
	static hasMany = [tracks: Track]
	static belongsTo = [artist: Artist]
	
	String toString() {
		title
	}
}
