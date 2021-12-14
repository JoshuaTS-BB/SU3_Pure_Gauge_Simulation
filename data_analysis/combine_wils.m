wils_dt_4={};
wils_dt_5={};

n=length(wils_dt1)/2;
for i=1:n
    wils_dt_4{i}=[wils_dt1{i}; wils_dt2{i}; wils_dt3{i}];
end

for i=(n+1):length(wils_dt1)
    wils_dt_5{i-n}=[wils_dt1{i}; wils_dt2{i}; wils_dt3{i}];
end