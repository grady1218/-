class OperationDrop
{
	int hei = 5;
	int wid = 6;

	int baseDropColor[][] = {
			{1,2,1,1,2,3},
			{4,2,4,5,3,3},
			{5,4,5,2,6,2},
			{4,3,6,6,5,3},
			{3,4,4,2,5,5}
		};
	int baseX = 0;
	int baseY = 0;
	
	int direction;
	int count = 0;
	int limit = 40;
	int hoge;
	
	int x = baseX;
	int y = baseY;
	int dropColor[][] = baseDropColor;

	boolean isKeyPressed = false;
	boolean islimit = false;

	OperationDrop( int px, int py ){
		dropColor = baseDropColor;
		x = px;
		y = py;
		count = 0;
	}

	int[][] getColor(){

		return dropColor;

	}

	void takeColor( int[][] field ){

		dropColor = field;

	}

	int getX(){
		return x;
	}

	int getY(){
		return y;
	}

	boolean send_flag(){
		return islimit;
	}

	void operation( int num ){
		switch( num ){
			case 37:{

				if( x == 0 ){
					return;
				}
				count++;
				hoge = dropColor[y][x];
				dropColor[y][x] = dropColor[y][x-1];
				dropColor[y][x-1] = hoge;
				x--;
				direction = 0;
				break;
			}

			case 38:{  
				if( y == 0 ){
					return;
				}
				count++;
				hoge = dropColor[y][x];
				dropColor[y][x] = dropColor[y-1][x];
				dropColor[y-1][x] = hoge;
				y--;
				direction = 1;
				break;
			}
			case 39:{
				if( x == wid - 1 ){
					return;
				}
				count++;
				hoge = dropColor[y][x];
				dropColor[y][x] = dropColor[y][x+1];
				dropColor[y][x+1] = hoge;
				x++;
				direction = 2;
				break;
			}
			case 40:{ 
				if( y == hei - 1 ){
					return;
				}
				count++;
				hoge = dropColor[y][x];
				dropColor[y][x] = dropColor[y+1][x];
				dropColor[y+1][x] = hoge;
				y++;
				direction = 3;
				break;
			}
			default: break;	
		}
	}

	void keyOperation(){

		if( keyPressed && !isKeyPressed && !islimit ){
			isKeyPressed = true;

			operation( keyCode );

			if( count == limit ){
				islimit = true;
			}
		}
		if( !keyPressed ){
			isKeyPressed = false;
		}
	}
}




