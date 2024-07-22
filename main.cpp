/*  5000000 sufix tree run out of memory
    auto test 5, 50, 500, 5000, 50000, 500000
    save as CSV
*/
#include <argp.h>
#include <assert.h>
#include <chrono>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sdsl/bp_support_sada.hpp>
#include <sdsl/csa_sada.hpp>
#include <sdsl/cst_sada.hpp>
#include <sdsl/lcp_support_sada.hpp>
#include <sdsl/suffix_tree_algorithm.hpp>

#include "Node.h"
#include "SuffixTree.h"
#include "utils.h"

#include "Banchmark.hpp"

using namespace sdsl;
using namespace std;
using namespace std::chrono;

int main(int argc, char **argv) {
  // Iskanje
  // string text1 = "kokos$";
  // SuffixTree st1(text1);
  // string pattern ="ko";
  // auto start1 = high_resolution_clock::now();
  // vector<int> rezultatIskanja = st1.check_for_sub_string(pattern.c_str());
  // auto stop1 = high_resolution_clock::now();
  // cout<<"Rez: "<< rezultatIskanja<<endl;
  // st1.free_suffix_tree_by_post_order(st1.get_root());
  // auto duration1 = duration_cast<milliseconds>(stop1 - start1);
  //
  // cst_sada<> cst1;
  // construct_im(cst1, text1,1);
  // auto occs = locate(cst1.csa, pattern);
  // cout << "locate(cst.csa, \"" << pattern << "\")=" << occs.size() << endl;
  // cout << occs << endl;
  // cout << endl;

  // Izgradnja
  string text = "";
  string pattern = "";
  string text_all = "";
  
  if (argc == 1) {
    text = "kokos";
  } else {
    string fileName = argv[1];
    ifstream file;
    string tmp = "";
    string t;
    file.open(fileName);
    while (getline(file, t)) {
      tmp.append(t);
    }
    text_all = tmp.substr(0, 11000000);
  }
  string out = "rezST";
  //out.append(argv[1]);
  out.append(".csv");
  ofstream out_s(out, ofstream::trunc);
  if (!out_s) {
    cout << "File se ne odpre." << endl;
    return -1;
  }
  out_s << "Time,SizeInBytes,SizeRun,TypeOfDS,tFind5,tFind10,tFind20,tFind40,"
           "tFind80,tFindLog,Log"
        << '\n';
  
  int n = 5;
  int m = 5;
  RunResault test[n];
  int j;
  for (j = 10000; j <= 3000000; j = j +100000) {
    sleep(10);
    int i;
    double totalTime = 0;
    int totalSize = 0;
    text = text_all.substr(0, j);
    cout << "Size " << j << ":" << endl;

    for(i=0;i<n;i++){
      auto start = high_resolution_clock::now();
      SuffixTree st(text);
      auto stop = high_resolution_clock::now();

      auto duration = duration_cast<milliseconds>(stop - start).count();
      test[i].time = duration;
      test[i].sizeInBytes=sizeof(st);
      test[i].sizeRun=text.length();
      test[i].typeStruct="St";
      int k=5;
      for(k=5;k<=80;k=k*2){
        pattern = text_all.substr(j,k);
        //cout<<"Pattern: "<<pattern<<endl;
        auto start1 = high_resolution_clock::now();
        vector<int> rezultatIskanja = st.check_for_sub_string(pattern.c_str()); 
        auto stop1 = high_resolution_clock::now();
        auto duration1 =  duration_cast<nanoseconds>(stop1 - start1).count();
        switch(k){ 
          case 5:
            test[i].timeFind5= duration1;
            break;
        case 10:
            test[i].timeFind10= duration1;
            break;
        case 20:
            test[i].timeFind20= duration1;
            break;
        case 40:
            test[i].timeFind40= duration1;
            break;
        case 80:
            test[i].timeFind80= duration1;
            break;
            }
      }
      k = (int) log2(j) +1;
      auto start1 = high_resolution_clock::now();
      vector<int> rezultatIskanja = st.check_for_sub_string(pattern.c_str()); 
      auto stop1 = high_resolution_clock::now();
      auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
      test[i].timeFindLog=duration1;
      test[i].Log=k;
      out_s << test[i].time << "," << test[i].sizeInBytes << ","
            << test[i].sizeRun << "," << test[i].typeStruct << ","
            << test[i].timeFind5 << "," << test[i].timeFind10 << ","
            << test[i].timeFind20 << "," << test[i].timeFind40 << ","
            << test[i].timeFind80 << "," << test[i].timeFindLog<< ","
            << test[i].Log<< '\n';
      st.free_suffix_tree_by_post_order(st.get_root());
    }

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
    /*
    sleep(10);
    for (i = 0; i < n; i++) {
      auto start = high_resolution_clock::now();
      cst_sada<> cst;
      construct(cst, text);
      auto stop = high_resolution_clock::now();
      auto duration = duration_cast<milliseconds>(stop - start).count();

      test[i].time = duration;
      test[i].sizeInBytes = size_in_bytes(cst);
      test[i].sizeRun = text.length();
      test[i].typeStruct = "CST";
      int k = 5;
      for (k = 5; k <= 80; k = k * 2) {
        pattern = text_all.substr(j, k);
        auto start1 = high_resolution_clock::now();
        auto occs = locate(cst.csa, pattern);
        auto stop1 = high_resolution_clock::now();
        auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
        switch (k) {
        case 5:
          test[i].timeFind5 = duration1;
          break;
        case 10:
          test[i].timeFind10 = duration1;
          break;
        case 20:
          test[i].timeFind20 = duration1;
          break;
        case 40:
          test[i].timeFind40 = duration1;
          break;
        case 80:
          test[i].timeFind80 = duration1;
          break;
        }
        test[i].pat = pattern;
      }
      k = (int) log2(j) + 1;
      auto start1 = high_resolution_clock::now();
      auto occs = locate(cst.csa, pattern);
      auto stop1 = high_resolution_clock::now();
      auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
      test[i].timeFindLog=duration1;
      test[i].Log=k;
      out_s << test[i].time << "," << test[i].sizeInBytes << ","
            << test[i].sizeRun << "," << test[i].typeStruct << ","
            << test[i].timeFind5 << "," << test[i].timeFind10 << ","
            << test[i].timeFind20 << "," << test[i].timeFind40 << ","
            << test[i].timeFind80 << "," << test[i].timeFindLog<< ","
            << test[i].Log<< '\n';
    }
    totalTime = 0;
    totalSize = 0;
    cout << "CST: " << endl;
    for (i = 0; i < n; i++) {
      cout << "Run " << i << ":" << endl;
      cout << "\tSize in B:" << test[i].sizeInBytes << endl;
      cout << "\tTime in ms:" << test[i].time << endl;
      totalSize = totalSize + test[i].sizeInBytes;
      totalTime = totalTime + test[i].time;
    }
    cout << "Summary: " << endl;
    cout << "\tSize in B:" << 1.0 * totalSize / n << endl;
    cout << "\tTime in ms:" << totalTime / n << endl;
    */
  }
  return 0;
}
