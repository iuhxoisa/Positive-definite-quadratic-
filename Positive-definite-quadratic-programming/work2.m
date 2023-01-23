clear;
seed = 97006855;
ss = RandStream('mt19937ar','Seed',seed);
RandStream.setGlobalStream(ss);
m = 512;
n = 1024;
A = randn(m, n);
b = randn(m,1);
x0 =randn(m,1);
cvx_begin
variable x(m);
minimize(1/2*quad_form(x'*A*x)-b'*x);
cvx_end
fun(x) = 1/2* x'*A*x-b'*x;
grad(x)= x'*A+b;
[alpha, xk, f, k] = Armjio(fun, grad, x0, dk);