class Track {
	String name
	static belongsTo = [Album]
	
	String toString() {
		name
	}
}
