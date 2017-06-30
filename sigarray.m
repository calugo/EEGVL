function [X,Y,time]=sigarray(EEG,trial, response,freq)
    trial
    response
    T=size(EEG)
    %T(1)
    time=[0:T(1)-1]*(1.0/freq)
    chn=[1:32]
    size(chn)
    size(time)
    size(EEG)
    Y=EEG
    X=meshgrid(time,chn)
    
    %figure(trial)
    %ribbon(X',EEG)
    
end