/*

class Field{
	DisplayDrop disp;
	OperationDrop opd;
	CheckCombo combo;
	FallDrop fall;
	GeneticAlgorithm geneAlgo;

	int maxCombo;

	boolean isStop = false;

	Field(){
		geneAlgo = new GeneticAlgorithm();
		opd   = new OperationDrop();
		disp  = new DisplayDrop();
		combo = new CheckCombo();
		fall  = new FallDrop();

	}

	void drawField(){        //ドロップを描写
		disp.drawDrop( opd.getX(), opd.getY(), opd.direction, opd.count );
	}

	void displayField(){     //フィールドを描写（ドロップを含め）

		drawField();
		disp.recieveField( opd.getColor() );

	}

	void operationDrop(){    //ドロップを操作する

		opd.keyOperation();
		displayField();

	}

	void isFinish(){         //終わったかを判定し、処理を行う
		
		int[][] hoge;

		do{

			combo.array_init();
		
			hoge = combo.synthesisArray( combo.searchComboWidth( opd.getColor() ),
				   combo.searchComboHeight( opd.getColor() ) );

			combo.checkCombo( hoge );
			maxCombo += combo.getMaxCombo();

			hoge = fall.downDrop( fall.deleteDrop( hoge, opd.getColor() ) );

			opd.takeColor( hoge );

		}while( combo.getMaxCombo() != 0 );
		
		println( "MaxCombo : " + maxCombo );

			//disp.drawCombo( combo.getComboField() );
			
	}
}
*/