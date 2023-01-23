clear;
seed = 97006855;
ss = RandStream('mt19937ar','Seed',seed);
RandStream.setGlobalStream(ss);
m = 20; 
n = 10; 
A = randn(m,n);
b = randn(m,1);
cvx_begin
variable x(m);
minimize(1/2*quad_form(x'*A*x)-b'*x);
cvx_end
f_star = cvx_optval;

x0 = randn(m,1);
opts1 = struct();
opts1.method = 'accurate_search';
addpath('E:\Matlab\my_algorithm')
[x1,out1] = quadratic_accurate(x0,B,b,f_star,opts1);

x0 = randn(m,1);
opts2 = struct();
opts2.method = 'armijo';
addpath('E:\Matlab\my_algorithm')
[x2,out2] = quadratic_armijo(x0,B,b,f_star,opts2);