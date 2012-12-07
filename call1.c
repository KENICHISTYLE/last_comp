
void c( int x)
{
  putchar(x);
}

void f(int x, int y) {
  putchar(x);
  putchar(y);
  // c(x );
  // putchar(x);
  //return;
}


int main() {
  //f('A', 'B');
  int i;
  i = 'A';
  // i++;	
  f(i, 'A');
  putchar(10);
}
