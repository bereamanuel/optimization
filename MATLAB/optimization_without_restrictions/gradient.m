function [D] = gradient(f, grad, x0, Tol,MaxIter,bk,t,max)
% INPUT:
%   - f: Multifunction
%   - Df: Gradient of f
%   - x0: Initial point
%   - maxiter: maxiter
%   - tol: tolerance
%   - bk: lim sup for serach unidimentional
%   - t: alpha
%   - max: maximize = 1, minimize = 0
% OUTPUT:
%   - x: Min candidate
%   - t: Time compsumtion
%   - k: Number of iterations used

Fgrad=[grad{1}(x0(1,1),x0(2,1))
       grad{2}(x0(1,1),x0(2,1))];                  
                                                  
if max==1
    Fgrad=Fgrad;                   
else
    Fgrad=-Fgrad;  
end

iter=1;                                        

while norm(Fgrad)>=Tol && iter<=MaxIter
      
    D(iter, :)={iter,x0,Fgrad,t}
      
    x0=x0+t*Fgrad;                 

      Fgrad=[grad{1}(x0(1,1),x0(2,1))
       grad{2}(x0(1,1),x0(2,1))];                 
                                                  
      if max==1
          Fgrad=Fgrad;             
      else
          Fgrad=-Fgrad;      
      end

      iter=iter+1;                              
      
     D(iter,:)={iter, x0, Fgrad, t}
end


end