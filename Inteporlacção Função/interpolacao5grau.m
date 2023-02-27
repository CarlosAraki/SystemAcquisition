function [X] = interpolacao5grau (t0,t1,p0,p1,v0,v1,a0,a1)

A = [
     1 t0 t0^2 t0^3 t0^4 t0^5
     0 1 2*t0 3*t0^2 4*t0^3 5*t0^4
     0 0 1 2 6*t0 12*t0^2 20*t0^2
     1 t1 t1^2 t1^3 t1^4 t1^5
     0 1 2*t1 3*t1^2 4*t1^3 5*t1^4
     0 0 1 2 6*t1 12*t1^2 20*t1^2
];

b = [p0 v0 a0 p1 v1 a1]';


X = inv(A)*b;

end