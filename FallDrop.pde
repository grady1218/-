
class FallDrop{

	int hei = 5;
	int wid = 6;

	int[][] process( int[][] field1, int[][] field2 ){
		return downDrop( deleteDrop( field1, field2 ) );
	}

	int[][] deleteDrop( int[][] field, int[][] deleteField ){
		for( int h = 0; h < hei; h++ ){
			for( int w = 0; w < wid; w++ ){
		
				if( field[h][w] != 0 ) deleteField[h][w] = 0;

			}
		}
		return deleteField;
	}

	int[][] downDrop( int[][] field ){

		for( int c = 0; c < 4; c++ ){
			for( int h = hei - 1; h > 0; h-- ){
				for( int w = 0; w < wid; w++ ){
					if( field[h][w] == 0 ){
						field[h][w] = field[h-1][w];
						field[h-1][w] = 0;
					}
				}
			}
		}
		return field;
	}
}
