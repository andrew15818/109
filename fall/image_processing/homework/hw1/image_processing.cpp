#include<string>
#include<fstream>
#include<algorithm>
#include<iostream>

#include "image_processing.h"

ImageProcessor::ImageProcessor(){

}

void ImageProcessor::process(const std::string& filename, const std::string& method){


	image.open(filename, std::ios_base::binary | std::ios::in | std::ios::ate);

	
	size = 0; // unsigned integer
	data = 0;	 // byte array

	image.seekg(0, std::ios::end);
	size = image.tellg();
	std::cout<<"image size: "<<size<<std::endl;

	image.seekg(0, std::ios::beg);

	data = new char[size - 8];
	image.seekg(8); // move 8 bytes into the stream

	// Read and store contents into data array
	image.read(data, size - 8);		

	// Check if error in reading file contents
	if(image){
		std::cout<<"Image opened and memory allocated."<<std::endl;	
	}	
	data[size-8] = '\0';	

	// Calling the appropriate function
	std::cout<<size<<std::endl;

	
}

void ImageProcessor::calculate_histogram()
{
	
}
