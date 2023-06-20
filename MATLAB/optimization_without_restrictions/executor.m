

Df= @(x) [(4*(x(1)-2)^3 + 2*(x(1)-2)*x(2)^2);
             (2*x(2)*(x(1)-2)^2+2*(x(2)+1))];

DDf = @(x) [(12*(x(1)-2)^2+2*x(2)^2)  (4*(x(1)-2)*x(2)); 
            (4*(x(1)-2)*x(2))  (2*(x(1)-2)^2+2)];

x0 = [1,1];
maxiter = 10;
tol = 1E-12;

Newton_Multi(Df,DDf,x0,maxiter,tol)


max=0;          
f=@(x,y) x^2-24*x + y^2-10*y;                   
grad={@(x,y) 2*x-24, ...
      @(x,y) 2*y-10};                            
x0=[8;7];                      
Tol=0.09;                                      
MaxIter=100;                               
bk=5;                  
t=0.5;  

gradient(f, grad, x0, Tol,MaxIter,bk,t,max)