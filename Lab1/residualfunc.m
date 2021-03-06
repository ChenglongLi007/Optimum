function [r,gradr]=residualfunc(x)
x_t = sym('x_t', [1 2]);
syms t_t y_t;
fh = (x_t(1)*(exp(x_t(2)*t_t))-y_t);
gr = gradient(fh, x_t);
gr = subs(gr, x_t, x);

t = [0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0];
y = [6.8 3.0 1.5 0.75 0.48 0.25 0.20 0.15];
%t=[1 2 4 5 8];
%y=[3.2939 4.2699 7.1749 9.3008 20.259];
gr =subs(gr,t_t,t);
gradr = double(gr);
fh = subs(fh, x_t,x);
fh =subs(fh,{t_t,y_t}, {t,y});
r = double(fh');
end