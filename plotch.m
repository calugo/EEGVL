function plotch(t,eeg,chnames,ch,resp,subj,response,lot)
    
    figure(ch+lot)
    titlen=strcat('Channel:', chnames(ch),' Subject: ',subj)
    size(t)
    size(eeg)
    size(response)
    response
    response(1:4)
    int2str(response(1))
    
    set(gcf,'numbertitle','off','name',titlen{1})
    N1=size(t,2)
    for fi=1:N1
     
        subplot(N1,1,fi);
        plot(t{fi},eeg{fi})
        title( strcat( 'Trial: ',int2str(fi) ,' Resp: ', int2str(response(fi)))   )
       %response(fi)
    end
    
end