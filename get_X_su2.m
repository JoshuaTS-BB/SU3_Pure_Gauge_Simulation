function [X] = get_X_su2()
%GET_X Returns a random SU(2) matrix near the identity (X and X^(-1) are
%chosen with equal probability)

% This parameter controls how much the matrix varies from the identity
epsilon=0.4;

%x0=randi([0,1]);
x1=random(-0.5,0.5);
x2=random(-0.5,0.5);
x3=random(-0.5,0.5);

r=(x1^2+x2^2+x3^2)^0.5;

x1=epsilon*x1/r;
x2=epsilon*x2/r;
x3=epsilon*x3/r;

x0=(1-epsilon^2)^0.5;
% if x0
%     x0=(1-epsilon^2)^0.5;
% else
%    x0=-(1-epsilon^2)^0.5;
% end

X = x0*[1 0; 0 1] + 1i*x1*[0 1; 1 0] + 1i*x2*[0 -1i; 1i 0] + 1i*x3*[1 0; 0 -1];

if randi([0,1])
    X = ctranspose(X);
end

end

