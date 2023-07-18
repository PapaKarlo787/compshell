#include <iostream>
using namespace std;

int n = 0;

void noTone(int a){}

void tone(int a, int b, int c){
	if (n == 0)
		cout << "dw ";
	cout << b << ", " << c * 10 / 9 << (n == 9 ? "\n" : ", ");
	n = (n + 1) % 10;
}

void delay(int a){}

#include "melody.h"

int main(){ 
	cout << "dd " << notes << endl;
	setup();
	cout << endl;
	return 0;
}
