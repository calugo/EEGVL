function [f,AVP2]=avp(t,EEG)

 AVP2=0.0*(0:length(EEG)/2);
 
 
 
 %iSVP=zeros(1+length(EEG)/2,32);
 %SiSVP=zeros(1+length(EEG)/2,1);
 
 
 %size(AVP2)
 %size(iSVP)
 %size(SiSVP)
 %pause
 clear mask
 freq=200
 
for i=1:32

    y=EEG(:,i);
    %plot(y)
   
    dtx=1/freq;
    L=length(y);
    
    Y = fft(y);
    f = freq*(0:(L/2))/L;
    fo= freq*(0:L-1)/L;
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);    
    mn = min(y); mx = max(y);
    %plot(f,P1)
    %pause
    %%%%%%%%%%%%%%%%%%%%%
    cut=0;
   
    for zj=1:length(f)
        f(zj)
        if f(zj)>45
            cut=zj;
            break
        end
    end
    cut
    
    
    mask(1:20)=0.0;
    mask(21:cut) = 1.0; %exp(-((f-cfreq)/(2*sigmaf)).^2);
    mask(cut+1:L/2+1)=0.0;
    mask(L:-1:L/2+2) = mask(2:L/2);
    %size(Y)
    %size(mask')
    %size(f)
    %mask
    Xfilt = (Y .* mask');
    %xfilt = ifft(Xfilt);
    iSVP(:,i)=abs(Xfilt(1:(L/2)+1)');
    AVP2=AVP2+abs(Xfilt(1:(L/2)+1)');
    %size(AVP2)
    %size(Xfilt(1:L/2+1))
    
    %plot(abs(Xfilt)/L)
    %pause
    

end
AVP2=AVP2/(32.0);
size(iSVP)
size(AVP2)
size(iSVP(:,1)')
%size(SiSVP)
SiSVP=0.0*(1:length(iSVP))
for i=1:32
    for j=1:length(iSVP)
        SiSVP(j)=SiSVP(j)+(iSVP(j,i)'-AVP2(j))^2;
    end
end
SiSVP=(SiSVP/32).^(1/2);
%SiSVP=SiSVP/32
%size(AVP2)

%plot(f,iSVP(:,1),f,iSVP(:,2),f,AVP2)
figure
%plot(f,AVP2,f,AVP2+SiSVP')
plot(f,AVP2)

end
