function [X] = rand_su3(s)
%GET_X Returns a random SU(3) matrix (as a vector)

R=[rand_su2() [0; 0]; 0 0 1];
S=rand_su2();
S=[S(1,1) 0 S(1,2); 0 1 0; S(2,1) 0 S(2,2)];
T=[1 0 0; [0; 0] rand_su2(s)];

X = R*S*T;
X=X(:);

end
