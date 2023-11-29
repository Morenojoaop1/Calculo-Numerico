clc
clear
n = 3;
A = [1 1 1; 2 1 -1; 2 -1 1];
b = [-2 1 3];
L = zeros(n,n);
U = zeros(n,n);

for j=1:n
    L(j,j) = 1;
    for i=1:j
       soma = 0.0;
        for k=1:i-1
            soma = soma + L(i,k)*U(k,j);
        end
        U(i,j) = A(i,j) - soma;       
    end
    for i=j+1:n
        soma = 0.0;
        for k=1:j-1
            soma = soma + L(i,k)*U(k,j);
        end
        L(i,j) = (A(i,j)-soma)/U(j,j);
    end
end
disp(L)
disp(U)
disp(L*U)
disp(A)

// L y = b
y = zeros(1,n);
y(1) = b(1)/L(1,1);
for i=2:n
    soma = 0.0;
    for j=1:i-1
        soma = soma + L(i,j)*y(j);
    end
    y(i) = (b(i)-soma)/L(i,i);
end

// U x = y
x(n) = y(n)/U(n,n);
for i=n-1:-1:1
    soma = 0.0;
    for j=i+1:n
        soma = soma + U(i,j)*x(j);
    end
    x(i) = (y(i)-soma)/U(i,i);
end
disp(x)


