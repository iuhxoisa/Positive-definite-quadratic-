function [alpha, xk, f, k] = Wolfe(fun, grad, x0, dk)

c = 1e-3; 		
c2 = 0.9;
a = 0; b = inf;
alpha = 1; 			
k = 0; 				

gk = feval(grad, x0);	
fd = feval(fun, x0 + alpha * dk);
fk = feval(fun, x0) + alpha * c * gk' * dk;
gp = feval(grad, x0 + alpha * dk); 
while true
    if fd > fk
        b = alpha;
        alpha = (a + b) / 2;
        fd = feval(fun, x0 + alpha * dk);
        fk = feval(fun, x0) + alpha * c * gk' * dk;
        gp = feval(grad, x0 + alpha * dk);
        k = k + 1;
        continue;
    end
    if gp' * dk < c2 * gk' * dk 
        a = alpha;
        alpha = min([2 * alpha, (a + b) / 2]);
        fd = feval(fun, x0 + alpha * dk);
        fk = feval(fun, x0) + alpha * c * gk' * dk;
        gp = feval(grad, x0 + alpha * dk);
        k = k + 1;
        continue;
    end
    break;
end
xk = x0 + alpha * dk;	
f = feval(fun, xk);
end