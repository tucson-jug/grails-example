class Artist {

	String name
	static hasMany = [albums:Album]
	
	String toString() {
		name
	}
}
