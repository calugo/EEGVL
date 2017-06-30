function [t,yt]=splitch(EEGi1,EEGi2,EEGm1,EEGm2,trial,response,freq,ch)

    trial;
    response;
    T=size(EEGi1);
    t=[0:T(1)-1]*(1.0/freq);
    yt=EEGi1(:,ch);
  
end 