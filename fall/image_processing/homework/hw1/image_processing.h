#ifndef IMAGE_PROC_H
#define IMAGE_PROC_H

#include<fstream>
#include<string>
class ImageProcessor{
	public:
		ImageProcessor();
		void process(const std::string&, const std::string& ); //process the individual image
		void contrast_adjustment();
		void noise_reduction();
		void color_correction();
};
#endif
