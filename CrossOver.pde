class CrossOver{

	int[][] twoPointCrossOver( int[] data1, int[] data2 ){

		int newParent[][] = new int[2][data1.length];

		int oneSep = int( random( data1.length / 2 ) );
		int twoSep = int( random( data1.length / 2, data1.length ) );

		for( int c = 0; c < oneSep; c++ ){
			newParent[0][c] = data1[c];
			newParent[1][c] = data2[c];
		}
		for( int c = oneSep; c < twoSep; c++ ){
			newParent[0][c] = data2[c];
			newParent[1][c] = data1[c];
		}
		for( int c = twoSep; c < data1.length; c++ ){
			newParent[0][c] = data1[c];
			newParent[1][c] = data2[c];
		}

		return newParent;
	}

	int[][] uniformCrossOver( int[] data1, int[] data2 ){
		int newParent[][] = new int[2][data1.length];
		for( int c = 0; c < data1.length; c++ ){
			if( int( random( 0, 2 ) ) == 0 ){
				newParent[0][c] = data1[c];
				newParent[1][c] = data2[c];				
			}else{
				newParent[0][c] = data2[c];
				newParent[1][c] = data1[c];
			}
		}
		return newParent;
	}

	int[] randomChange( int[] d, int p ){
		int[] data = d.clone();
		for( int c = 0; c < data.length; c++ ){
			if( int( random( p ) ) == 0 )
				data[c] = int( random( 37, 41 ) );
		}
		return data;
	}

}