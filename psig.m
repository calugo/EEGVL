function psig(y,freq)
 dt=1/freq;
 disp(dt);
 N=size(y)
 t=[0:N-1]*dt 
 size(y)
 plot(t,y)
end