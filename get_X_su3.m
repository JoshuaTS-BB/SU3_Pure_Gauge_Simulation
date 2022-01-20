function [X] = get_X_su3(s)
%GET_X Returns a random SU(3) matrix near the identity (X and X^(-1) are
%chosen with equal probability)

R=[get_X_su2(s) [0; 0]; 0 0 1];
S=get_X_su2(s);
S=[S(1,1) 0 S(1,2); 0 1 0; S(2,1) 0 S(2,2)];
T=[1 0 0; [0; 0] get_X_su2(s)];

X = R*S*T;

if randi(s,[0,1])
    X = ctranspose(X);
end

end

