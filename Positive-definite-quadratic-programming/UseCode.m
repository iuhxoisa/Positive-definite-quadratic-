clc;
close all;

m = 512;
n = 1024;
A = randn(m, n);
b =randn(n, 1);
x0=randn(n, 1);
eps = 1e-4;
kmax = 100000;
fprintf('初始点',x0)
[f, xk, k] = GraDes(x0, fun, grad , eps, kmax,0);
fprintf('梯度下降算法：最佳点位于x0，函数值为f,共迭代次数');