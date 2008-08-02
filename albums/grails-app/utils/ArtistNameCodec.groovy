class ArtistNameCodec {

    // encodeAsArtistName
	static encode = { theTarget ->
		theTarget.replaceAll(' ', '_')
	}
	
	// decodeArtistName
	static decode = { theTarget ->
		theTarget.replaceAll('_', ' ')
	}
	
	
}