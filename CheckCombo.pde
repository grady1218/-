class CheckCombo
{
	private int hei = 5;
	private int wid = 6;
	private int count = 0;
	private int[][] heiArray = new int[hei][wid];
	private int[][] widArray = new int[hei][wid];
	private int[][] synthe = new int[hei][wid];
	private int[][] combo = new int[hei][wid];
	private int[][] check = new int[hei][wid];

	CheckCombo(){

		initfield( heiArray );
		initfield( widArray );
		initfield( check );

	}

	void array_init(){

		heiArray = new int[hei][wid];
		widArray = new int[hei][wid];
		synthe = new int[hei][wid];
		combo = new int[hei][wid];
		check = new int[hei][wid];
		count = 0;

	}

	int[][] process( int[][] field ){
		int[][] f;
		array_init();
		f = synthesisArray( searchComboWidth( field ), searchComboHeight( field ) );
		checkCombo();
		return f;
	}

	int[][] searchComboWidth( int[][] field ){

		for( int h = hei - 1; h >= 0; h-- ){
			for( int w = 0; w < wid - 2 ; w++ ){
				
				if( field[h][w] == field[h][w+1] && field[h][w] == field[h][w+2] ){
					for( int c = 0; c < 3; c++ ){
						widArray[h][w+c] = field[h][w+c];
					}
				}
			}
		}
		return widArray;
	}

	int[][] searchComboHeight( int[][] field ){
		for( int h = 0; h < hei - 2; h++ ){
			for( int w = 0; w < wid; w++ ){
				
				if( field[h][w] == field[h+1][w] && field[h][w] == field[h+2][w] ){
					for( int c = 0; c < 3; c++ ){
						heiArray[h+c][w] = field[h+c][w];
					}
				}
			}
		}
		return heiArray;
	}

	int[][] synthesisArray( int[][] field1, int[][] field2 ){

		for( int h = 0; h < hei; h++ ){
			for( int w = 0; w < wid; w++ ){

				synthe[h][w] = field1[h][w];

				if( field2[h][w] != 0 ){
					synthe[h][w] = field2[h][w];
				}
				
			}
		}
		return synthe;
	}

	void checkCombo(){

		for( int h = hei - 1; h >= 0; h-- ){
			for( int w = 0; w < wid; w++ ){
				if( check[h][w] == 0 && synthe[h][w] != 0 ){
					count++;
					reSearch( w, h, count );		
				}
			}
		}
	}

	void reSearch( int x, int y, int c ){

		check[y][x] = c;

		if( x != 5 ){
			if( synthe[y][x] == synthe[y][x + 1] && check[y][x + 1] == 0 ) reSearch( x + 1, y, c );
		}
		if( y != 4 ){
			if( synthe[y][x] == synthe[y + 1][x] && check[y + 1][x] == 0 ) reSearch( x, y + 1, c );
		}
		if( x != 0 ){
			if( synthe[y][x] == synthe[y][x - 1] && check[y][x - 1] == 0 ) reSearch( x - 1, y, c );
		}
		if( y != 0 ){
			if( synthe[y][x] == synthe[y - 1][x] && check[y - 1][x] == 0 ) reSearch( x, y - 1, c );
		}
	}

	int getMaxCombo(){
		return count;
	}

	int[][] getComboField(){
		return check;
	}

	void initfield( int[][] field ){
		for( int h = 0; h < hei; h++ ){
			for( int w = 0; w < wid; w++ ){
				field[h][w] = 0;
			}
		}
	}
}