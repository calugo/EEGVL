function area=pclass(f,P,x1,x2)
dx=f(2)-f(1)
sa=0.0

for i=1:(length(f)-1)
    if(f(i)<x1)  || (f(i)>=x2)
        sk=0.0
    else
        sk=1.0
    end
    sa=sa+sk* ( abs(P(i+1)-P(i))*0.5 + min(P(i+1),P(i)) )*dx
end

area=sa