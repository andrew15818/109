#include<iostream>

#include<cstdio>
#include<string>
#include "image_processing.h"

int main(int argc, char* argv[]){

	if(argc == 1){
		printf("Please specify an image filename.\n");	
		return 1;
	}
	ImageProcessor imgProc;
	std::string filename = argv[1];
	imgProc.process(filename, "contrast adjustment");	
	return 0;
}
