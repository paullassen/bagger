#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <utility> // std::pair
#include <stdexcept> // std::runtime_error
#include <sstream> // std::stringstream

int main(){
	
	std::string str = "3.2,asshole,5.0,1e2";
	std::stringstream ss(str);
	std ::string str_;
	int f_count = 0;
	bool stop = false;
	double val;
	std::string val_;


	while(std::getline(ss, str_, ',')){
		if(	std::stringstream(str_) >> val){
			std::cout << val << std::endl;
		}
	}

	return 0;
}
