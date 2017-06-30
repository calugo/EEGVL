function plotelec(Chanlocs,Channames)
%figure()

labels = Channames; % Note the {}
N=size(Chanlocs)
%figure
X=[]
Y=[]
Z=[]
for j=1:N
    X(j)=Chanlocs(j,1)
    Y(j)=Chanlocs(j,2)
    Z(j)=Chanlocs(j,3)
    %Chanlocs(j,1:3)
end

S = repmat([70],numel(X),1);
C = repmat([1],numel(X),1);
s = S(:);
c = C(:);
%S = repmat(90,numel(X),1);
%C = repmat(100,numel(X),1);
%s = S(:);
%c = C(:);

h=scatter3(X,Y,Z,s,c)
h.MarkerFaceColor = [0 0.5 0.5];
text(X,Y,Z,labels)

h1=scatter3(X,Y,Z,s,c)
h1.MarkerFaceColor = [0 0.5 0.5];
text(X,Y,Z,labels)


h2=scatter3(X,Y,Z,s,c)
h2.MarkerFaceColor = [0 0.5 0.5];
text(X,Y,Z,labels)

h3=scatter3(X,Y,Z,s,c)
h3.MarkerFaceColor = [0 0.5 0.5];
text(X,Y,Z,labels)


end