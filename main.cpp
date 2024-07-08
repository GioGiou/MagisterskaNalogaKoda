/*  5000000 sufix tree run out of memory
    auto test 5, 50, 500, 5000, 50000, 500000
    save as CSV
*/
#include <iostream>
#include <fstream>
#include <chrono>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <argp.h>

#include <sdsl/cst_sada.hpp>
#include <sdsl/lcp_support_sada.hpp>
#include <sdsl/csa_sada.hpp>
#include <sdsl/bp_support_sada.hpp>

#include "Node.h"
#include "utils.h"
#include "SuffixTree.h"

#include "Banchmark.hpp"



using namespace sdsl;
using namespace std;
using namespace std::chrono;



int main(int argc, char **argv ){
    string text="";
    string text_all="";
    ofstream out_s("rez.csv",ofstream::trunc);
    out_s <<"Time,SizeInBytes,sizeRun,Type" <<'\n';
    if(!out_s){
        cout<<"File se ne odpre."<<endl;
        return -1;
    }
    if (argc==1){
        text = "kokos";
    }
    else {
        string fileName = argv[1];
        ifstream file;
        string tmp="";
        string t;
        file.open(fileName);
        while(getline(file, t)){
            tmp.append(t);
        }
        text_all = tmp.substr(0,500000);
    }
    int n = 5;
    RunResault test[n];
    int j;
    for(j=2;j<=800000;j=j*2){
        
        text = text_all.substr(0,j);
        cout<<"Size "<<j<<":"<<endl;
        int i;
        for(i=0;i<n;i++){
            auto start = high_resolution_clock::now();
            SuffixTree st(text);
            auto stop = high_resolution_clock::now();
            st.free_suffix_tree_by_post_order(st.get_root());
            auto duration = duration_cast<milliseconds>(stop - start);
            test[i].time = duration.count();
            test[i].sizeInBytes=sizeof(st);
            test[i].sizeRun=text.length();
            test[i].type="St";
            out_s << test[i].time <<"," << test[i].sizeInBytes <<"," << test[i].sizeRun <<","<< test[i].type <<'\n';
        }
        int totalTime=0;
        int totalSize =0;
        cout<<"Suffix tree (Ukkonen): "<<endl;
        for(i=0;i<n;i++){
            cout<<"Run "<<i<<":"<<endl;
            cout<<"\tSize in B:"<<test[i].sizeInBytes<<endl;
            cout<<"\tTime in ms:"<<test[i].time<<endl;
            totalSize = totalSize + test[i].sizeInBytes;
            totalTime = totalTime + test[i].time;
        }
        cout<<"Summary: "<<endl;
        cout<<"\tSize in B:"<<1.0*totalSize/n<<endl;
        cout<<"\tTime in ms:"<<1.0*totalTime/n<<endl;
        
        for(i=0;i<n;i++){
            auto start = high_resolution_clock::now();
            cst_sada<> cst;
            construct_im(cst, text, 1);
            auto stop = high_resolution_clock::now();
            auto duration = duration_cast<milliseconds>(stop - start);
            test[i].time = duration.count();
            test[i].sizeInBytes=size_in_bytes(cst);
            test[i].sizeRun=text.length();
            test[i].type="CST";
            out_s << test[i].time <<"," << test[i].sizeInBytes <<"," << test[i].sizeRun <<","<< test[i].type <<'\n';
        }
        totalTime=0;
        totalSize =0;
        cout<<"CST: "<<endl;
        for(i=0;i<n;i++){
            cout<<"Run "<<i<<":"<<endl;
            cout<<"\tSize in B:"<<test[i].sizeInBytes<<endl;
            cout<<"\tTime in ms:"<<test[i].time<<endl;
            totalSize = totalSize + test[i].sizeInBytes;
            totalTime = totalTime + test[i].time;
        }
        cout<<"Summary: "<<endl;
        cout<<"\tSize in B:"<<1.0*totalSize/n<<endl;
        cout<<"\tTime in ms:"<<1.0*totalTime/n<<endl;
    }
    return 0;
}
