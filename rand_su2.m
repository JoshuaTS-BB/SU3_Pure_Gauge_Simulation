function [X] = rand_su2(s)
%GET_X Returns the first row of a random SU(2) matrix

epsilon=random(0,1,s);

x0=randi(s,[0,1]);
x1=random(-0.5,0.5,s);
x2=random(-0.5,0.5,s);
x3=random(-0.5,0.5,s);

r=(x1^2+x2^2+x3^2)^0.5;

x1=epsilon*x1/r;
x2=epsilon*x2/r;
x3=epsilon*x3/r;

if x0
    x0=(1-epsilon^2)^0.5;
else
    x0=-(1-epsilon^2)^0.5;
end

X = x0*[1 0; 0 1] + 1i*x1*[0 1; 1 0] + 1i*x2*[0 -1i; 1i 0] + 1i*x3*[1 0; 0 -1];

end
