#include "libmini.h"
int main(){
	sigset_t hola;
	sigsetempty(&hola);
	alarm(3);
	pause();
	return 0;
}
