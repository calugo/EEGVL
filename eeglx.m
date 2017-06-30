clear all
close all
path='../REPOS/EEG/'
fnames = dir(fullfile(path, '*.mat'));
disp(fnames);
load(strcat(path,fnames.name));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plotelec(Chanlocs,Channames)
%pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
freq=fs
u=size(Response)
%u(1)
var = 'X1_';
vari1 = cell(8,1);

var2 = 'X2_';
vari2 = cell(8,1);

var3 = 'Y1_';
vari3 = cell(8,1);

var4 = 'Y2_';
vari4 = cell(8,1);

var5 = 'z1_';
varj1 = cell(8,1);

var6 = 'z2_';
varj2 = cell(8,1);

var7 = 'w1_';
varj3 = cell(8,1);

var8 = 'w2_';
varj4 = cell(8,1);

var9 = 'tna'
vark1 = cell(8,1)

var10= 'tnb'
vark2= cell(8,1)

var11= 'tma'
vark3= cell(8,1)

var12 = 'tmb'
vark4 = cell(8,1)



for i = 1:8  
      vari1(i) = {[var num2str(i)]};
      vari2(i) = {[var2 num2str(i)]};
      vari3(i) = {[var4 num2str(i)]};
      vari4(i) = {[var4 num2str(i)]};
      
      varj1(i) = {[var5 num2str(i)]};
      varj2(i) = {[var6 num2str(i)]};
      varj3(i) = {[var7 num2str(i)]};
      varj4(i) = {[var8 num2str(i)]};
      
      vark1(i) = {[var9 num2str(i)]};
      vark2(i) = {[var10 num2str(i)]};
      vark3(i) = {[var11 num2str(i)]};
      vark4(i) = {[var12 num2str(i)]};
      
end

for tr=1:8
    Response(tr)
    A1=EEG_mother{tr,1}
    A2=EEG_mother{tr,2}
    B1=EEG_infant{tr,1}
    B2=EEG_infant{tr,2}
   
    [Xa,Za,tq1]=sigarray(A1,tr,Response(tr),freq) 
    assignin('base', vari1{tr}, Xa);
    assignin('base', varj1{tr}, Za);
    assignin('base', vark1{tr}, tq1);
    
  
    [Xb,Zb,tq2]=sigarray(A2,tr,Response(tr),freq)
    assignin('base', vari2{tr}, Xb);
    assignin('base', varj2{tr}, Zb);
    assignin('base', vark2{tr}, tq2); 
    
  
    [Xc,Zc,tq3]=sigarray(B1,tr,Response(tr),freq)  
    assignin('base', vari3{tr}, Xc);
    assignin('base', varj3{tr}, Zc);
    assignin('base', vark3{tr}, tq3); 
 
    [Xd,Zd,tq4]=sigarray(B2,tr,Response(tr),freq)  
    assignin('base', vari4{tr}, Xd);
    assignin('base', varj4{tr}, Zd); 
    assignin('base', vark4{tr}, tq4); 
 
   
    clear A1 A2 B1 B2 Xa Xb Xc Xd Za Zb Zc Zd tq1 tq2 tq3 tq4
end
clear var var2 var3 var4 var5 var6 var7 var8
%clear vari1 vari2 vari3 vari4 varj1 varj2 varj3 varj4
%cse=''
%plotch({tna1,tna2},{z1_1(:,1),z1_2(:,1)},Response,Chn,cse)
%%%%
% Resp 1: 
rsp1=[3,4,5,7]

tnx='{tna1,tna2,tna3,tna4,tna5,tna6,tna7,tna8}'
InA={'z1_1','z1_2','z1_3','z1_4','z1_5','z1_6','z1_7','z1_8'}

tnx2='{tnb1,tnb2,tnb3,tnb4,tnb5,tnb6,tnb7,tnb8}'
InAx={'z2_1','z2_2','z2_3','z2_4','z2_5','z2_6','z2_7','z2_8'}

tmx='{tma1,tma2,tma3,tma4,tma5,tma6,tma7,tma8}'
InB={'w1_1','w1_2','w1_3','w1_4','w1_5','w1_6','w1_7','w1_8'}

tmx2='{tmb1,tmb2,tmb3,tmb4,tmb5,tmb6,tmb7,tmb8}'
InBx={'w2_1','w2_2','w2_3','w2_4','w2_5','w2_6','w2_7','w2_8'}


for i=1:32
    a=strcat(tnx,',{');
    for j=1:8
        a=strcat(a,InA(j),'(:,',int2str(i),')');
        if(j<8)
            a=strcat(a,',')
        end
    end
    %Channames(i)
    css='MOTHER-POS';
    lot=0;
    a=strcat(a,'},','Channames',',',int2str(i),',1',', css',', Response',', lot)')
    bs=strcat('plotch(',a)
    eval('base',bs{1})
    %pause
end
%pause
%%%%
for i=1:32
    a=strcat(tnx2,',{');
    for j=1:8
        a=strcat(a,InAx(j),'(:,',int2str(i),')');
        if(j<8)
            a=strcat(a,',')
        end
    end
    %Channames(i)
    css='MOTHER-NEG'
    lot=32;
    a=strcat(a,'},','Channames',',',int2str(i),',1',', css',', Response',', lot)')
    bs=strcat('plotch(',a)
    eval('base',bs{1})
    %pause
end
%pause
%%%
for i=1:32
    a=strcat(tmx,',{');
    for j=1:8
        a=strcat(a,InB(j),'(:,',int2str(i),')');
        if(j<8)
            a=strcat(a,',')
        end
    end
    %Channames(i)
    css='INF-POS'
    lot=64;
    a=strcat(a,'},','Channames',',',int2str(i),',1',', css',', Response',', lot)')
    bs=strcat('plotch(',a)
    eval('base',bs{1})
    %pause
end
%pause
%%%%%
for i=1:32
    a=strcat(tmx2,',{');
    for j=1:8
        a=strcat(a,InBx(j),'(:,',int2str(i),')');
        if(j<8)
            a=strcat(a,',')
        end
    end
    %Channames(i)
    css='INF-NEG'
    lot=96;
    a=strcat(a,'},','Channames',',',int2str(i),',1',', css',', Response',', lot)')
    bs=strcat('plotch(',a)
    eval('base',bs{1})
    %pause
end
%pause
for i=1:8
    figure(32*4+i)
    subplot(2,1,1)
    strips(eval(InB{i})) 
    subplot(2,1,2)
    strips(eval(InBx{i}))
    
end

