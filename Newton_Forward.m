clc;
close all;
x= [2.94:0.48:6.30]; % Write the values of independent variable x.
y = [5 6 7 8 9 10 11 12]; % Write the values of dependent variable y.
n=length(x); % Number of terms of X or Y
d=zeros(n-1);
h=x(2)-x(1); %step length
x0=input('Enter the value of x where we want to find the value of f(x): ');
u=(x0-x(1))/h;
for i=2:n %Calculation of first forward differences
    d(i-1,1)=y(i)-y(i-1);
end
for k=2:n-1 %Calculation of second and rest forward differences
    for i=1:n-k
        d(i,k)= d(i+1,k-1)-d(i,k-1);
    end
end
disp('The forward difference table is:')
 d
s=y(1); t=u;
for k=1:n-1 %Calculation of result
    s=s+t*d(1,k);
    t=(u-k)/(k+1)*t;
end
fprintf('The required value is f(%f)= %5.5f',x0,s);

%Formula: f(x0)=y(1)+u*(del)y(1)+u*(u-1)/2!(del)^2y(1)+....+u*(u-1)..(u-n+1)/n!(del)^ny(1)
%where h=x(2)-x(1)=step length and u=(x0-x(1))/h. Hree del:= forward
%difference operator.