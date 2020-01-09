class DisplayDrop
{
	int hei = 5;
	int wid = 6;
	int a[][] = new int[hei][wid];

	float dropSize = width / wid;
	float h = height - ( dropSize * hei );

	String direction[] = { "←", "↑", "→", "↓" };

	DisplayDrop(){
		ellipseMode( CORNER );
	}

	void recieveField( int field[][] ){

		for(int i = 0; i< hei; i++ ){
			for(int j = 0; j < wid; j++ ){
				a[i][j] = field[i][j];
			}
		}
	}

	void drawDrop( int x, int y, int d, int count ){

		background( 255 );

	    for( int p = 0; p < hei; p++ ){
			for( int c = 0; c < wid; c++ ){

					if( p == y && c == x ){
						strokeWeight( 5 );
					}else{
						strokeWeight( 1 );
					}
					
					dropColor( a[p][c] );
					ellipse( c * dropSize, p * dropSize + h, dropSize, dropSize );


			}
		}

		/*
			ここでカウント数などの情報を描写する。
		*/		
		textSize( 35 );
		fill( #000000 );
		text( direction[ d ] + "\ncount : " + count + "\nepoch : " + geneAlgo.epoch + "\nMaxCombo : " + geneAlgo.mostmaxcombo, 50, 20 );
	}

	void drawCombo( int data[][] ){

	    for( int p = 0; p < hei; p++ ){
			for( int c = 0; c < wid; c++ ){

				fill( #000000 );
				
				if( data[p][c] != 0 ){
					textSize( 30 );
					text( data[p][c], ( dropSize * c ) + ( dropSize / 2 ) - 15, ( dropSize * p ) + h + 40 );
				}
			}
		}
	}

	void dropColor( int num ){
		switch ( num ) {
			case 0:fill( #FFFFFF ); break;
			case 1:fill( #0000FF ); break;
			case 2:fill( #00FF00 ); break;
			case 3:fill( #FFFF00 ); break;
			case 4:fill( #555555 ); break;
			case 5:fill( #FF3399 ); break;
			case 6:fill( #FF0000 ); break;
		}
	}
}
