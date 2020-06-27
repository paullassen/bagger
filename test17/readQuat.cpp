#include <iomanip>
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <utility> // std::pair
#include <stdexcept> // std::runtime_error
#include <sstream> // std::stringstream

std::vector<std::pair<std::string, std::vector<long double> > > read_csv(std::string filename){
    // Reads a CSV file into a vector of <string, vector<int>> pairs where
    // each pair represents <column name, column values>

    // Create a vector of <string, int vector> pairs to store the result
    std::vector<std::pair<std::string, std::vector<long double> > > result;

    // Create an input filestream
    std::ifstream myFile(filename, std::ifstream::in);

    // Make sure the file is open
    if(!myFile.is_open()) throw std::runtime_error("Could not open file");

    // Helper vars
    std::string line, colname;
    long double val;

    // Read the column names
    if(myFile.good())
    {
        // Extract the first line in the file
        std::getline(myFile, line);

        // Create a stringstream from line
        std::stringstream ss(line);

        // Extract each column name
        while(std::getline(ss, colname, ',')){
            std::cout << colname << std::endl;
            // Initialize and add <colname, int vector> pairs to result
            result.push_back({colname, std::vector<long double> {}});
        }
    }

    // Read data, line by line
    while(std::getline(myFile, line))
    {
        // Create a stringstream of the current line
        std::stringstream ss(line);
        
        // Keep track of the current column index
        int colIdx = 0;
        
        // Extract each integer
        while(std::getline(ss, colname, ',')){
			if (std::stringstream(colname) >> val){
				result.at(colIdx).second.push_back(val);
			}else{
				result.at(colIdx).second.push_back(-110);
			}
            // Increment the column index
            colIdx++;
        }
    }

    // Close file
    myFile.close();

    return result;
}

void write_csv(std::string filename, std::vector<std::pair<std::string, std::vector<long double> > > dataset){
    // Make a CSV file with one or more columns of integer values
    // Each column of data is represented by the pair <column name, column data>
    //   as std::pair<std::string, std::vector<int>>
    // The dataset is represented as a vector of these columns
    // Note that all columns should be the same size
    
    // Create an output filestream object
    std::ofstream myFile(filename, std::ofstream::out);
	std::cout << "Create filestream" << std::endl;   
    // Send column names to the stream
    for(int j = dataset.size()-4; j < dataset.size(); ++j)
    {
        myFile << dataset.at(j).first;
        if(j != dataset.size() - 1) myFile << ","; // No comma at end of line
    }
    myFile << "\n";
    std::cout << "More comments" << std::endl;
    // Send data to the stream
    for(int i = 0; i < dataset.at(0).second.size(); ++i)
    {
        for(int j = dataset.size()-4; j < dataset.size(); ++j)
        {
			std::cout << i << "\t" << j << std::endl;
            myFile << std::setw(25) << std::setprecision(25) << dataset.at(j).second.at(i);
            if(j != dataset.size() - 1) myFile << ","; // No comma at end of line
        }
        myFile << "\n";
    }
    
    // Close the file
    myFile.close();
}

int main() {
    // Read three_cols.csv and ones.csv
    std::vector<std::pair<std::string, std::vector<long double> > > three_cols = read_csv("bagfile-_test_mocap.csv");
    //std::vector<std::pair<std::string, std::vector<int> > > ones = read_csv("ones.csv");
	std::cout << "Done Reading" << std::endl;
    // Write to another file to check that this was successful
    write_csv("three_cols_copy.csv", three_cols);
    //write_csv("ones_copy.csv", ones);
    
    return 0;
}

