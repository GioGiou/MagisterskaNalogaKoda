#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <unistd.h>

using namespace std;

int KMP(string text, string pattern);
int* prefixArray(string pattern);
