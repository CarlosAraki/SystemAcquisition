function [eq] = eqinterpolada(X)

syms t

eq  = X(1)*1 + X(2)*t +X(3)*t^2 +X(4)*t^3 + X(5)*t^4+X(6)*t^5;


end