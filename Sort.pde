class Sort{

	int num[];

	void init(){
		for( int c = 0; c < num.length; c++ )
			num[c] = c;		
	}

	void merge(int[] a1,int[] a2,int[] a){
		int i = 0, j = 0;
		while( i < a1.length || j < a2.length ){
			if( j >= a2.length || ( i < a1.length && a1[i] < a2[j] ) ){
				a[i + j] = a1[i];
				i++;
			}else{
				a[i + j] = a2[j];
				j++;
			}
		}
	}

		/*
		* マージソート
		* 既にソート済みの2つの配列を併合して新しい配列を
		* 生成することで、データのソートを行います。
		*/
	void mergeSort(int[] a){
		if(a.length>1){
			int m=a.length/2;
			int n=a.length-m;
			int[] a1=new int[m];
			int[] a2=new int[n];
			for(int i=0;i<m;i++) a1[i]=a[i];
			for(int i=0;i<n;i++) a2[i]=a[m+i];
			mergeSort(a1);
			mergeSort(a2);
			merge(a1,a2,a);
		}
	}

	void bubbleSort( int[] d ){

		this.num = new int[d.length];

		init();

		for( int i = 0; i < d.length; i++ ){
			for( int j = i + 1; j < d.length; j++ ){
				if( d[i] < d[j] ){

					int hoge = 0;
					int hoge2 = 0;
					
					hoge2 = num[i];
					num[i] = num[j];
					num[j] = hoge2;
					
					hoge = d[i];
					d[i] = d[j];
					d[j] = hoge;
				}
			}
		}
	}

	int selectOne( int[] data ){
		int max = 0;
		int num = 0;
		for( int count = 0; count < data.length; count++ ){
			if( max < data[count] ){
				max = data[count];
				num = count;
			}
		}
		return num;
	}

}