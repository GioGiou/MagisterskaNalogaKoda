#include <iostream>
#include <fstream>
#include <sdsl/cst_sada.hpp>
#include <sdsl/lcp_support_sada.hpp>
#include <sdsl/csa_sada.hpp>
#include <sdsl/bp_support_sada.hpp>
#include <chrono>

#include "Banchmark.hpp"

using namespace sdsl;
using namespace std;
using namespace std::chrono;


int main(int argc, char **argv ){
    string text;
    if (argc==1){
        text = "ananasbananaabrakadabrajaniananasbananaabrajani";
    }
    else if(argc==2){
        text = argv[1];

    }
    else{
        string fileName = argv[1];
        ifstream file;
        string tmp="";
        string t;
        file.open(fileName);
        while(getline(file, t)){
            tmp.append(t);
        }
        
        text = tmp.substr(0,stol(argv[2]));
    }
    int n = 5;
    RunResault test[n];

    int i;
    for(i=0;i<n;i++){
        auto start = high_resolution_clock::now();
        cst_sada<> cst;
        construct_im(cst, text, 1);
        auto stop = high_resolution_clock::now();
        auto duration = duration_cast<milliseconds>(stop - start);
        test[i].time = duration.count();
        test[i].sizeInBytes=size_in_bytes(cst);
        test[i].sizeRun=text.length();
    }
    int totalTime=0;
    int totalSize =0;
    for(i=0;i<n;i++){
        cout<<"Run "<<i<<":"<<endl;
        cout<<"\tSize in B:"<<test[i].sizeInBytes<<endl;
        cout<<"\tTime in ms:"<<test[i].time<<endl;
        totalSize = totalSize + test[i].sizeInBytes;
        totalTime = totalTime + test[i].time;
    }
    cout<<"Summary: "<<endl;
    cout<<"\tSize in B:"<<1.0d*totalSize/n<<endl;
    cout<<"\tTime in ms:"<<1.0d*totalTime/n<<endl;
    return 0;
}
