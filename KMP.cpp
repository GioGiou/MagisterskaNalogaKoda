#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "KMP.h"

int KMP(string text, string pattern){
        int* prefix = prefixArray(pattern);
        int len = text.length();
        int patLen = pattern.length();
        int i =0;
        int j = 0;
        while(i<len){
          if(text[i] == pattern[i]){
            if(j == patLen){
              return i-j;
            }
            else{
              j++;
              i++;
            }
          }
          else{
            if(j>0){
              j=prefix[j-1];
            }
            else{
              i++;
            }
          }
        }
	return -1;
}

int* prefixArray(string pattern){
      int len = pattern.length();
      int i =1;
      int j =0;
      int* rez = new int[len];
      while (i<len){
            if(pattern[i]==pattern[j]){
              j++;
              rez[i]=j;
              i++;
            }
            else if(j>0){
              j=rez[j-1];
            }
            else{
              rez[i]=0;
              i++;
            }      
      }
      return rez;
}
