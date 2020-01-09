GeneticAlgorithm geneAlgo;

void setup(){
	
	size( 300, 500, P2D );

	geneAlgo = new GeneticAlgorithm();

	geneAlgo.generateAlgorithm();

	frameRate(60);
	
}

void draw(){
	geneAlgo.mainFrame( geneAlgo.generation );
}