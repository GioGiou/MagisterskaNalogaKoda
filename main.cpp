/*  5000000 sufix tree run out of memory
    auto test 5, 50, 500, 5000, 50000, 500000
    save as CSV
*/
#include <argp.h>
#include <assert.h>
#include <algorithm>
#include <chrono>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// Compprest suffix tree
#include <sdsl/bp_support_sada.hpp>
#include <sdsl/csa_sada.hpp>
#include <sdsl/cst_sada.hpp>
#include <sdsl/lcp_support_sada.hpp>
#include <sdsl/suffix_tree_algorithm.hpp>

// Suffix tree
#include "Node.h"
#include "SuffixTree.h"
#include "utils.h"

// Suffix array
#include "libsais.h"

#include "Banchmark.hpp"

using namespace sdsl;
using namespace std;
using namespace std::chrono;

int lcp_min(int *lcp,int L, int R);
bool find_sa(int* SA, string text, string pattern, int n);
int string_compare(string text, string pattern, int index);
bool find_sa_LCP(int* SA, int* LCP, string text, string pattern, int n);
int find_k(string text, string pattern, int index, int k);
int string_compare_from_k(string text, string pattern, int index, int k);
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
  // auto duration1 = duration_cast<nanoseconds>(stop1 - start1);
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
    text_all = tmp.substr(0, 25000000);
    int i = 500;
    while (text_all.length()<25000000){
    	text_all.append(tmp.substr(i,5*i));
    	text_all = text_all.substr(0, 25000000);
    	i=i+500;
    }
  }
  string out = "rezNovPcNaKlancu";
  //out.append(argv[1]);
  out.append(".csv");
  ofstream out_s(out, ofstream::trunc);
  if (!out_s) {
    cout << "File se ne odpre." << endl;
    return -1;
  }
  out_s << "Time,SizeInBytes,SizeRun,TypeOfDS,tFind5,tFind50,"/*",tFind500,tFind5000,"*/
           "tFind500,tFindLog,Log"
        << '\n';
  
  int n = 5;
  int m = 5;
  RunResault test[n];
  int j;
  // program je bil Killan pri n=3310000
  //ST j= 3500000; no chrome: j = 10000000
  //CST j = 20000000

/* 	Intel i3 5005U
	ST: 2048000 je prekine testiranje, I/O sleep 500
*/
  for (j = 500; j <= 2000000 /*3000000*/; j = j*2) {
    sleep(10);
    int i;
    double totalTime = 0;
    int totalSize = 0;
    text = text_all.substr(0, j-1);
    text.append("\0");
    
    // cout << text << endl;
	  cout << "Size " << j << ":" << endl;
    //ST
    for(i=0;i<n;i++){
      cout << i;	
	    cout.flush();
      auto start = high_resolution_clock::now();
      SuffixTree st(text);
      auto stop = high_resolution_clock::now();
      
      auto duration = duration_cast<nanoseconds>(stop - start).count();
      test[i].time = duration;
      test[i].sizeInBytes=sizeof(st);
      test[i].sizeRun=text.length();
      test[i].typeStruct="St";
      int k=5;
      cout << "TEST";	
	    cout.flush();
      for(k=5;k<=500;k=k*10){
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
        case 50:
            test[i].timeFind50= duration1;
            break;
        case 500:
            test[i].timeFind500= duration1;
            break;
       /* case 5000:
            test[i].timeFind5000= duration1;
            break;
        case 50000:
            test[i].timeFind50000= duration1;
            break;*/  //Komentar
            }
      }
      k=800;
      pattern = text_all.substr(j,k);
      auto start1 = high_resolution_clock::now();
      vector<int> rezultatIskanja = st.check_for_sub_string(pattern.c_str()); 
      auto stop1 = high_resolution_clock::now();
      auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
      test[i].timeFind800=duration1;
      k = (int) log2(j) +1;
      pattern = text_all.substr(j,k);
      start1 = high_resolution_clock::now();
      rezultatIskanja = st.check_for_sub_string(pattern.c_str()); 
      stop1 = high_resolution_clock::now();
      duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
      test[i].timeFindLog=duration1;
      test[i].Log=k;
      out_s << fixed <<  test[i].time << "," << test[i].sizeInBytes << ","
            << test[i].sizeRun << "," << test[i].typeStruct << ","
            << test[i].timeFind5 << "," << test[i].timeFind50 << ","
            << test[i].timeFind500 /*<< "," << test[i].timeFind5000 << ","
            << test[i].timeFind50000 */ << "," << test[i].timeFindLog<< "," // komenrat
            << test[i].Log<< '\n';
      st.free_suffix_tree_by_post_order(st.get_root());
     cout <<"\r"; 
     cout.flush(); 
    }
    cout<<"Suffix tree (Ukkonen): "<<endl;
    for(i=0;i<n;i++){
        cout<<"Run "<<i<<":"<<endl;
        cout<<"\tSize in B:"<<test[i].sizeInBytes<<endl;
        cout<<"\tTime in ms:"<< fixed << test[i].time<<endl;
        totalSize = totalSize + test[i].sizeInBytes;
        totalTime = totalTime + test[i].time;
    }
    cout<<"Summary: "<<endl;
    cout<<"\tSize in B:"<<1.0*totalSize/n<<endl;
    cout<<"\tTime in ms:"<< fixed << 1.0*totalTime/n<<endl;

    //SA
    sleep(10);
    for (i = 0; i < n; i++) {
	  cout << i;
	  cout.flush();
      auto start = high_resolution_clock::now();
      cst_sada<> cst;
      construct(cst, text);
      auto stop = high_resolution_clock::now();
      auto duration = duration_cast<nanoseconds>(stop - start).count();

      test[i].time = duration;
      test[i].sizeInBytes = size_in_bytes(cst);
      test[i].sizeRun = text.length();
      test[i].typeStruct = "CST";
      int k = 5;
      for (k = 5; k <= 50000; k = k * 10) {
        pattern = text_all.substr(j, k);
        auto start1 = high_resolution_clock::now();
        auto occs = locate(cst.csa, pattern);
        auto stop1 = high_resolution_clock::now();
        auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
        switch (k) {
	       case 5:
	       test[i].timeFind5= duration1;
	       break;
	   case 50:
	       test[i].timeFind50= duration1;
	       break;
	   case 500:
	       test[i].timeFind500= duration1;
	       break;
	  /* case 5000:
	       test[i].timeFind5000= duration1;
	       break;
	   case 50000:
	       test[i].timeFind50000= duration1;
	       break; // komentar*/
        }
        test[i].pat = pattern;
      }
      k=800;
      pattern = text_all.substr(j,k);
      auto start1 = high_resolution_clock::now();
      auto occs = locate(cst.csa, pattern);
      auto stop1 = high_resolution_clock::now();
      auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
      test[i].timeFind800=duration1;
      k = (int) log2(j) +1;
      pattern = text_all.substr(j,k);
      start1 = high_resolution_clock::now();
      occs = locate(cst.csa, pattern);
      stop1 = high_resolution_clock::now();
      duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
      test[i].timeFindLog=duration1;
      test[i].Log=k;
      out_s << fixed <<  test[i].time << "," << test[i].sizeInBytes << ","
            << test[i].sizeRun << "," << test[i].typeStruct << ","
            << test[i].timeFind5 << "," << test[i].timeFind50 << ","
            << test[i].timeFind500 <</* "," << test[i].timeFind5000 << ","
            << test[i].timeFind50000 << // komenrat */"," << test[i].timeFindLog<< ","
            << test[i].Log<< '\n';
	  cout << "\r";
	  cout.flush();
    }
    totalTime = 0;
    totalSize = 0;
    cout << "CST: " << endl;
    for (i = 0; i < n; i++) {
      cout << "Run " << i << ":" << endl;
      cout << "\tSize in B:" << test[i].sizeInBytes << endl;
      cout << "\tTime in ms:" << fixed <<  test[i].time << endl;
      totalSize = totalSize + test[i].sizeInBytes;
      totalTime = totalTime + test[i].time;
    }
    cout << "Summary: " << endl;
    cout << "\tSize in B:" << 1.0 * totalSize / n << endl;
    cout << "\tTime in ms:" << fixed <<  totalTime / n << endl;


    //SA
    sleep(10);
    for (i = 0; i < n; i++) {
	  //cout << i;
	  cout.flush();
      auto start = high_resolution_clock::now();
      int SA[j]; 
      int rez = libsais((const unsigned char*) text.c_str(),SA,j,0, NULL);  
      //auto   construct(cst, text); 
      auto stop = high_resolution_clock::now();
      auto duration = duration_cast<nanoseconds>(stop - start).count();
      cout << rez << endl;
      cout << "SA[5]: "<< SA[5] << endl;
      test[i].time = duration;
      //test[i].sizeInBytes = size_in_bytes(cst);
      test[i].sizeRun = text.length();
      test[i].typeStruct = "SA";
      int k = 5;
      for (k = 5; k <= 50000; k = k * 10) {
        pattern = text_all.substr(j, k);
        auto start1 = high_resolution_clock::now();
        auto occs = find_sa(SA,text,pattern,j);
        auto stop1 = high_resolution_clock::now();
        auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
        switch (k) {
	       case 5:
	       test[i].timeFind5= duration1;
	       break;
	   case 50:
	       test[i].timeFind50= duration1;
	       break;
	   case 500:
	       test[i].timeFind500= duration1;
	       break;
	  /* case 5000:
	       test[i].timeFind5000= duration1;
	       break;
	   case 50000:
	       test[i].timeFind50000= duration1;
	       break;// komenrat*/
        }
        test[i].pat = pattern;
      }
      k = (int) log2(j) +1;
      pattern = text_all.substr(j,k);
      auto start1 = high_resolution_clock::now();
      bool occ = find_sa(SA,text,pattern,j);
      auto stop1 = high_resolution_clock::now();
      auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
      test[i].timeFindLog=duration1;
      test[i].Log=k;
      out_s << fixed <<  test[i].time << "," << test[i].sizeInBytes << ","
            << test[i].sizeRun << "," << test[i].typeStruct << ","
            << test[i].timeFind5 << "," << test[i].timeFind50 << ","
            << test[i].timeFind500 << /* "," << test[i].timeFind5000 << ","
            << test[i].timeFind50000 << // komentar*/ "," << test[i].timeFindLog<< ","
            << test[i].Log<< '\n';
	  cout << "\r";
	  cout.flush();
    }
    totalTime = 0;
    totalSize = 0;
    cout << "SA: " << endl;
    for (i = 0; i < n; i++) {
      cout << "Run " << i << ":" << endl;
      cout << "\tSize in B:" << test[i].sizeInBytes << endl;
      cout << "\tTime in ms:" << fixed <<  test[i].time << endl;
      totalSize = totalSize + test[i].sizeInBytes;
      totalTime = totalTime + test[i].time;
    }
    cout << "Summary: " << endl;
    cout << "\tSize in B:" << 1.0 * totalSize / n << endl;
    cout << "\tTime in ms:" << fixed <<  totalTime / n << endl;

    //SA + LCP
    sleep(10);
    for (i = 0; i < n; i++) {
      //cout << i;
      cout.flush();
      int SA[j]; 
      int PLCP[j];
      int LCP[j];
      vector<vector<int>> RLLCP(j,vector<int>(2)); 
      auto start = high_resolution_clock::now();
      
      libsais((const unsigned char*) text.c_str(),SA,j,0, NULL);
      int rezPLCP = libsais_plcp((const unsigned char*) text.c_str(),SA,PLCP,j);
      int rezLCP = libsais_lcp(PLCP,SA,LCP,j);
      int rezRLLCP = lcp_min(LCP,4,5);
      //auto   construct(cst, text); 
      auto stop = high_resolution_clock::now();
      auto duration = duration_cast<nanoseconds>(stop - start).count();
      cout << rezPLCP << endl;
      cout << rezLCP << endl;
      cout << rezRLLCP << endl;
      cout << "SA[0]: "<< SA[0] << endl;
      cout << "SA[4]: "<< SA[4] << endl;
      cout << "SA[5]: "<< SA[5] << endl;
      cout << "LCP[5]: "<< LCP[5] << endl;
      cout << "LCP[4]: "<< LCP[4] << endl;
      
      test[i].time = duration;
      //test[i].sizeInBytes = size_in_bytes(cst);
      test[i].sizeRun = text.length();
      test[i].typeStruct = "SA+LCP";
      int k = 5;
      pattern = text_all.substr(j, k);
        auto start1 = high_resolution_clock::now();
        auto occs = find_sa_LCP(SA,LCP,text,pattern,j);
        auto stop1 = high_resolution_clock::now();
        auto duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
        switch (k) {
	       case 5:
	       test[i].timeFind5= duration1;
	       break;
	   case 50:
	       test[i].timeFind50= duration1;
	       break;
	   case 500:
	       test[i].timeFind500= duration1;
	       break;
	  /* case 5000:
	       test[i].timeFind5000= duration1;
	       break;
	   case 50000:
	       test[i].timeFind50000= duration1;
	       break;// komenrat*/
        }
        test[i].pat = pattern;
      
      k = (int) log2(j) +1;
      pattern = text_all.substr(j,k);
      start1 = high_resolution_clock::now();
      occs = find_sa_LCP(SA,LCP,text,pattern,j);
      stop1 = high_resolution_clock::now();
      duration1 = duration_cast<nanoseconds>(stop1 - start1).count();
      test[i].timeFindLog=duration1;
      test[i].Log=k;
      out_s << fixed <<  test[i].time << "," << test[i].sizeInBytes << ","
            << test[i].sizeRun << "," << test[i].typeStruct << ","
            << test[i].timeFind5 << "," << test[i].timeFind50 << ","
            << test[i].timeFind500 <</* "," << test[i].timeFind5000 << ","
            << test[i].timeFind50000 << // komentar*/ "," << test[i].timeFindLog<< ","
            << test[i].Log<< '\n'; 
	  cout << "\r";
	  cout.flush();
    }
    totalTime = 0;
    totalSize = 0;
    cout << "SA+LCP: " << endl;
    for (i = 0; i < n; i++) {
      cout << "Run " << i << ":" << endl;
      cout << "\tSize in B:" << fixed << test[i].sizeInBytes << endl;
      cout << "\tTime in ms:" <<  fixed << test[i].time << endl;
      totalSize = totalSize + test[i].sizeInBytes;
      totalTime = totalTime + test[i].time;
    }
    cout << "Summary: " << endl;
    cout << "\tSize in B:" << 1.0 * totalSize / n << endl;
    cout << "\tTime in ms:" << fixed << totalTime / n << endl;
  }
 
  return 0;
}



int lcp_min(int *lcp,int L, int R){
  auto rez = min_element(lcp+L,lcp+R+1);
  return *rez;
}

bool find_sa(int* SA, string text, string pattern, int n){
  int L = 0;
  int R =n;
  int M = (L+R)/2;
  while (L<R){
    string suffix = text.substr(SA[M], n);
    int comp = string_compare(text,pattern,SA[M]);
    if(comp==0){ return true;}
    else if(comp==-1){
      R=M;
      M = (L+R)/2;
    }
    else if(comp==+1){
      L=M;
      M = (L+R)/2;
    }
    else{
      cout << "Napaka" << endl;
      return false;
    }
  }
  int comp = string_compare(text,pattern,SA[M]);
  if(comp==0){ return true;}
  return false;
}
int string_compare(string text, string pattern, int index){
  int i=0;
  while(text[index+i]==pattern[i] && i<pattern.length()){
    i++;
  }
  if(i=pattern.length()){return 0;}
  else if(text[index+i]<pattern[i]){return 1;}
  else if(text[index+i]>pattern[i]){return -1;}
  return -2;
}

int string_compare_from_k(string text, string pattern, int index, int k){
  int i=k;
  while(text[index+i]==pattern[i] && i<pattern.length()){
    i++;
  }
  if(i=pattern.length()){return 0;}
  else if(text[index+i]<pattern[i]){return 1;}
  else if(text[index+i]>pattern[i]){return -1;}
  return -2;
}

int find_k(string text, string pattern, int index, int k){
  int i=k;
  while(text[index+i]==pattern[i] && i<pattern.length()){
    i++;
  }
  return i;
}

bool find_sa_LCP(int* SA, int* LCP, string text, string pattern, int n){
  int L = 0;
  int R =n-1;
  bool levo = true;
  int M = (L+R)/2;
  int k = find_k(text,pattern,SA[M],0);
  int comp = string_compare_from_k(text,pattern,SA[M],k);
  if(comp == 0){return true;}
  else if(comp==-1){
    levo = true;
    R=M;
    M = (L+R)/2;
  }
  else if(comp==+1){
    levo = false;
    L=M;
    M = (L+R)/2;
  }
  else{
    cout << "Napaka" << endl;
    return false;
  }  
  while (L<R){
    if(levo){
      int minLCP = lcp_min(LCP, M, R);
      if(minLCP<k){
        levo=true;
        R=M;
        M = (L+R)/2;
      }
      else if(minLCP>k){
        levo = false;
        R=M;
        M = (L+R)/2;
      }
      else if (minLCP==k){
        k = find_k(text,pattern,SA[m],k);
        comp  = string_compare_from_k(text,pattern,SA[M],k);
        if(comp == 0){return true;}
        else if(comp==-1){
          levo = true;
          R=M;
          M = (L+R)/2;
        }
        else if(comp==+1){
          levo = false;
          L=M;
          M = (L+R)/2;
        }
        else{
          cout << "Napaka" << endl;
          return false;
        }
      }
      else{
        cout << "Napaka" << endl;
        return false;
      }
      
    }
    else{
      int minLCP = lcp_min(LCP, L, M);
      if(minLCP<k){
        levo=false;
        L=M;
        M = (L+R)/2;
      }
      else if(minLCP>k){
        levo = true;
        R=M;
        M = (L+R)/2;
      }
      else if (minLCP==k){
        k = find_k(text,pattern,SA[m],k);
        comp  = string_compare_from_k(text,pattern,SA[M],k);
        if(comp == 0){return true;}
        else if(comp==-1){
          levo = true;
          R=M;
          M = (L+R)/2;
        }
        else if(comp==+1){
          levo = false;
          L=M;
          M = (L+R)/2;
        }
        else{
          cout << "Napaka" << endl;
          return false;
        }
      }
      else{
        cout << "Napaka" << endl;
        return false;
      }
    }
  }
  comp = string_compare_from_k(text,pattern,SA[M],k);
  if(comp==0){ return true;}
  return false;
}
