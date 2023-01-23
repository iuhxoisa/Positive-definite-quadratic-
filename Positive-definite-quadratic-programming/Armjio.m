function [alpha, xk, f, k] = Armjio(fun, grad, x0, dk)
beta = 0.333; 		
c = 1e-3; 		
alpha = 1; 			
k = 0; 			
gk = feval(grad, x0);	
fd = feval(fun, x0 + alpha * dk);
fk = feval(fun, x0) + alpha * c * gk' * dk; 
fp = feval(fun, x0) + alpha * (1-c) * gk' * dk; 
while fd > fk || fd < fp 
    alpha = beta * alpha; 
    fd = feval(fun, x0 + alpha * dk);
    fk = feval(fun, x0) + alpha * c * gk' * dk;
    fp = feval(fun, x0) + alpha * (1-c) * gk' * dk;
    k = k + 1;
end
xk = x0 + alpha * dk;	
f = feval(fun, xk);
end
