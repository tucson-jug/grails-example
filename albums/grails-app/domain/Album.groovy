class Album {
	String title
	static hasMany = [tracks:Track]
	static belongsTo = [artist:Artist]

	String toString() {
		title
	}
}
