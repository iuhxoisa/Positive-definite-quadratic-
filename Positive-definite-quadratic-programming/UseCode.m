clc;
close all;

m = 512;
n = 1024;
A = randn(m, n);
b =randn(n, 1);
x0=randn(n, 1);
eps = 1e-4;
kmax = 100000;
fprintf('��ʼ��',x0)
[f, xk, k] = GraDes(x0, fun, grad , eps, kmax,0);
fprintf('�ݶ��½��㷨����ѵ�λ��x0������ֵΪf,����������');