#ifndef IMAGE_PROC_H
#define IMAGE_PROC_H
#include<string>
class ImageProcessing{
	public:
		ImageProcessing(){};
		void process(const std::string& filename); //process the individual image
};
#endif
