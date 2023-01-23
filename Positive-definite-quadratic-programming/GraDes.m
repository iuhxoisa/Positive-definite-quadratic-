k = 0;
xk = x0; 
gk = feval(grad, xk); 
while k <= kmax
    if norm(gk) < eps 
        break; 
    end
    dk = -gk; 
    if delta == 1
        alpha = Wolfe(fun, grad, xk, dk);
    else
        alpha = Armjio(fun, grad, xk, dk);
    end
    xk = xk + alpha * dk; 
    gk = feval(grad, xk); 
    k = k + 1;
end
f = feval(fun, xk);
end
