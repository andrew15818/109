struct args{
	int p;
	int o;
	char sharedPath[256];
	char outPath[256];
};
void getArgs(struct args*, int args, char** argv);
