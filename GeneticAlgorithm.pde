class GeneticAlgorithm
{
	OperationDrop opd;
	CrossOver cOver;
	DisplayDrop disp;
	CheckCombo combo;
	FallDrop fall;

	int limit = 50;
	int maxCombo = 0;
	int epoch = 0;
	int goalEpoch = 1000;
	int downSpeed = 1;
	int mostmaxcombo = 0;

	int generation[][] = new int[20][limit];
	int maxComboArray[] = new int[20];

	int frame = 0; //フレームカウント用
	int count = 0; //フレーム数が一定になったらカウントするやつ

	String state = "evalution";
	String mode = "afullSpeed";

	boolean stopSignal = false;

	GeneticAlgorithm(){

		cOver = new CrossOver();

		opd   = new OperationDrop(int( random( 0, 6 ) ),int( random( 0, 5 ) ));
		disp  = new DisplayDrop();
		combo = new CheckCombo();
		fall  = new FallDrop();

	}

	void init(){
		this.maxComboArray = new int[20];
		this.generation = new int[20][limit];
		maxCombo = 0;
		count = 0;
	}

	void generateAlgorithm(){ //ここでランダムに生成

		int x;
		int y;
		int rand = 0;

		for( int a = 0; a < 20; a++ ){
			x = 2;
			y = 2;
			for( int b = 0; b < limit; b++ ){
				
				rand = int( random( 37, 41 ) );
				
				if( ( x == 0 && rand == 37 ) ||
					( y == 0 && rand == 38 ) ||
					( x == opd.baseDropColor[0].length && rand == 39 ) ||
					( y == opd.baseDropColor.length && rand == 40 )
				){
					b--;
					continue;
				}

				if( rand == 37 ) x--;
				if( rand == 38 ) y--;
				if( rand == 39 ) x++;
				if( rand == 40 ) y++;

				generation[a][b] = rand;

				//print( generation[0][a][b] );
			}
			//println();
		}
	}

	void mainFrame( int[][] data ){

		if( epoch == goalEpoch ) mode = "normal";

		if( epoch == 2 ){
			mode = "fullSpeed";
			frameRate( 1000 );
		}

		if( mode == "fullSpeed" )
			fullSpeedGen( data );
		else{
			display();
			if( epoch == goalEpoch ){
				frameRate( 10 );
				downSpeed = 10;
			}
			if( state == "evalution" ){
				evalution( data );
			}else if( state == "process" ){
				process();
			}else if( state == "next" ){
				selectParent();
			}
		}
	}

	void display(){	
		disp.recieveField( opd.getColor() );
		disp.drawDrop( opd.getX(), opd.getY(), opd.direction, opd.count );
	}

	void fullSpeedGen( int[][] data ){
		while( state != "next" ){
			if( state == "evalution" ) evalution( data );
			if( state == "process" ) process();
		}
		selectParent();
	}

	void evalution( int[][] data ){

		if( frame < limit ){

			opd.operation( data[count][frame] );
			frame++;

		}else{
			state = "process";
			frame = 0;
		}
	}

	void process(){

		int[][] hoo;

		boolean noCombo = false;

		frame++;

		if( frame >= downSpeed ){

			hoo = combo.process( opd.getColor() );
			maxCombo += combo.getMaxCombo();
			hoo = fall.process( hoo, opd.getColor() );
			opd.takeColor( hoo );

			frame = 0;

			if( combo.getMaxCombo() == 0 )
				noCombo = true;
		}

		if( noCombo ){

			if( count < 19 ){
				maxComboArray[count] = maxCombo;
				state = "evalution";
				maxCombo = 0;
				count++;
			}else{
				state = "next";
			}
			
			opd = new OperationDrop( 2, 2 );
		
		}
	}

	int changeToScore( int data ){ //評価関数
		return data * data * data * data * data * data + 1;
	}

	int[] mutation( int[] data ){ //突然変異

		for( int c = 0; c < data.length; c++ ){
			if( int( random( 4 ) ) == 0 ){
				data[c] = int(random( 37, 41 ));
			}
		}

		return data;
	}

	void selectParent(){

		Sort s = new Sort();

		int allScore = 0;
		int rand1;
		int rand2;
		int select1 = 0;
		int select2 = 0;

		s.bubbleSort( maxComboArray.clone() );

		int stayNode[] = s.num.clone();

		int newGen[][] = new int[generation.length][limit];

		mostmaxcombo = maxComboArray[stayNode[0]];

		if( mostmaxcombo == 10 ) mode = "hohoho";

		if( epoch % ( goalEpoch / 100 ) == 0 )println("MostMaxCombo: "+mostmaxcombo);

		for( int c = 0; c < 2; c++ ){
			newGen[c] = generation[stayNode[c]];
		}


		for( int data: maxComboArray )
			allScore += changeToScore( data );


		for( int n = 1; n < maxComboArray.length / 2; n++ ){
			rand1 = int( random( allScore ) );
			rand2 = int( random( allScore ) );

			for( int c = 0; c <= maxComboArray.length; c++ ){
				if( rand1 <= 0 ){
					select1 = c;
					break;
				}else{
					rand1 -= changeToScore( maxComboArray[c] );
				}
			}
			for( int c = 0; c <= maxComboArray.length; c++ ){
				if( rand2 <= 0 ){
					select2 = c;
					break;
				}else{
					rand2 -= changeToScore( maxComboArray[c] );
				}
			}

			if( select1 == select2 ){
				n--;
				continue;
			}

			int p[][] = cOver.twoPointCrossOver( generation[select1], generation[select2] );

			newGen[n*2]   = p[0];
			newGen[n*2+1] = p[1];

			for( int c = 2; c < maxComboArray.length; c++ ){
				if( epoch % 50 == 0 ){
					if( int( random( 4 ) ) == 0 ) newGen[c] = mutation( newGen[c] );
				}else{
					if( int( random( 20 ) ) == 0 ) newGen[c] = mutation( newGen[c] );
				}
			}

		}
		init();
		generation = newGen;
		state = "evalution";
		epoch++;
		if( epoch % ( goalEpoch / 100 ) == 0 )println("epoch: "+epoch);
	}
}
