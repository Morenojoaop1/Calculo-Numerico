clear
clc

function [y]=f(x)
    y=x^2-2;
endfunction

function secante(a,b,e1,qtd)
    
    i=0;
    for k=0:qtd
        
        while(abs(b-a)>e1)
            
            x=(a*f(b)-b*f(a))/(f(b)-f(a))
            
            printf('\nx= %g, F(a)= %g, F(b)= %g',x,f(a),f(b));
            printf('\nA= %g, B= %g, X= %g',a,b,x);
    
            a=b;
            b=x;
            
            i=i+1;
        end
    end

printf('\nNº de Iterações: %g, e a RAIZ é %g',i,x);
    
endfunction
