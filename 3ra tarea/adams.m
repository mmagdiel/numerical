function [T Y]=adams(f,T,Y,D,M)
n=length(T);
F=zeros(1,M+2);
for i=1:M+1
    a=T(i);
    b=Y(i);
    c=feval(f,a,b);
    F(i)=c;
end
F
h=T(2)-T(1);
for k=M+1:n-1
    p=Y(k)+h*F*D';
    T(k+1)=T(1)+h*k;
      for j=2:M
          F(j-1)=F(j);
      end
     F(M+1)=feval(f,T(k+1),p);
     Y(k+1)=p;
     F
end
T=T;
Y=Y;
    