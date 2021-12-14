function [X] = get_X_su3()
%GET_X Returns a random SU(3) matrix near the identity (X and X^(-1) are
%chosen with equal probability)

R=[get_X_su2() [0; 0]; 0 0 1];
S=get_X_su2();
S=[S(1,1) 0 S(1,2); 0 1 0; S(2,1) 0 S(2,2)];
T=[1 0 0; [0; 0] get_X_su2()];

X = R*S*T;

if randi([0,1])
    X = ctranspose(X);
end

end

