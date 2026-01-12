% =========================================================================
% Electro Magnetic Wave Propagation Algorithm (EMWPA)
%  Source codes demo version 1.0                                                                      
%                                                                                                     
%  Developed in MATLAB R2018a                                                                                
%  Email: abdullahbjr@gmail.com                                                             
%                                                                                                                                                                    
%  Homepage:                                             
%                                                                                                     
%  Main paper:  https://doi.org/10.1016/j.asej.2025.103615  
% =========================================================================
% This file includes first four benchmark test functions employed in Tables 1 and 2
% of the EMWPA paper. All benchmark functions are adopted from:
%
% https://matlabiran.ir/function/index.php
%
% lb   : Lower bound vector [lb1, lb2, ..., lbd]
% ub   : Upper bound vector [ub1, ub2, ..., ubd]
% dim  : Problem dimension
% fobj : Objective function handle
% =========================================================================


function [lb,ub,dim,fobj] = Get_Functions_detailsEMWPA(F)


switch F
    case 'F1'
        fobj = @ackley;
        lb=-32.768;            % lb=Lower bounds of input variables
        ub=32.768;             % ub=Upper bounds of input variables
        dim=2;                
        
     case 'F2'
        fobj = @bukin6;   
        % lb=[-15, -3]; % LB          
        % ub= [-5,  +3]; % UB        
        lb=-15; % LB          
        ub= 3; % UB  
        dim=2;       
        
  
        
    case 'F3'
        fobj = @griewank;
        lb=-600;
        ub=600;
        dim=2;
        


    case 'F4'
        fobj = @levy;
        lb=-10;
        ub=10;
        dim=3;
        

    otherwise
        error('Undefined benchmark function.');
        
end

end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%     https://matlabiran.ir/function/index.php


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y] = ackley(xx, a, b, c)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ACKLEY FUNCTION
%
% Authors: Sonja Surjanovic, Simon Fraser University
%          Derek Bingham, Simon Fraser University
% Questions/Comments: Please email Derek Bingham at dbingham@stat.sfu.ca.
%
% Copyright 2013. Derek Bingham, Simon Fraser University.
%
% THERE IS NO WARRANTY, EXPRESS OR IMPLIED. WE DO NOT ASSUME ANY LIABILITY
% FOR THE USE OF THIS SOFTWARE.  If software is modified to produce
% derivative works, such modified software should be clearly marked.
% Additionally, this program is free software; you can redistribute it 
% and/or modify it under the terms of the GNU General Public License as 
% published by the Free Software Foundation; version 2.0 of the License. 
% Accordingly, this program is distributed in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
% General Public License for more details.
%
% For function details and reference information, see:
% http://www.sfu.ca/~ssurjano/
%
% INPUTS:
%
% xx = [x1, x2, ..., xd]
% a = constant (optional), with default value 20
% b = constant (optional), with default value 0.2
% c = constant (optional), with default value 2*pi


d = length(xx);

if (nargin < 4)
    c = 2*pi;
end
if (nargin < 3)
    b = 0.2;
end
if (nargin < 2)
    a = 20;
end

sum1 = 0;
sum2 = 0;
for ii = 1:d
	xi = xx(ii);
	sum1 = sum1 + xi^2;
	sum2 = sum2 + cos(c*xi);
end

term1 = -a * exp(-b*sqrt(sum1/d));
term2 = -exp(sum2/d);

y = term1 + term2 + a + exp(1);

end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y] = bukin6(xx)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% BUKIN FUNCTION N. 6
%
% Authors: Sonja Surjanovic, Simon Fraser University
%          Derek Bingham, Simon Fraser University
% Questions/Comments: Please email Derek Bingham at dbingham@stat.sfu.ca.
%
% Copyright 2013. Derek Bingham, Simon Fraser University.
%
% THERE IS NO WARRANTY, EXPRESS OR IMPLIED. WE DO NOT ASSUME ANY LIABILITY
% FOR THE USE OF THIS SOFTWARE.  If software is modified to produce
% derivative works, such modified software should be clearly marked.
% Additionally, this program is free software; you can redistribute it 
% and/or modify it under the terms of the GNU General Public License as 
% published by the Free Software Foundation; version 2.0 of the License. 
% Accordingly, this program is distributed in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
% General Public License for more details.
%
% For function details and reference information, see:
% http://www.sfu.ca/~ssurjano/
%
% INPUTS:
%
% xx = [x1, x2]


x1 = xx(1);
x2 = xx(2);

term1 = 100 * sqrt(abs(x2 - 0.01*x1^2));
term2 = 0.01 * abs(x1+10);

y = term1 + term2;

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y] = griewank(xx)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% GRIEWANK FUNCTION
%
% Authors: Sonja Surjanovic, Simon Fraser University
%          Derek Bingham, Simon Fraser University
% Questions/Comments: Please email Derek Bingham at dbingham@stat.sfu.ca.
%
% Copyright 2013. Derek Bingham, Simon Fraser University.
%
% THERE IS NO WARRANTY, EXPRESS OR IMPLIED. WE DO NOT ASSUME ANY LIABILITY
% FOR THE USE OF THIS SOFTWARE.  If software is modified to produce
% derivative works, such modified software should be clearly marked.
% Additionally, this program is free software; you can redistribute it 
% and/or modify it under the terms of the GNU General Public License as 
% published by the Free Software Foundation; version 2.0 of the License. 
% Accordingly, this program is distributed in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
% General Public License for more details.
%
% For function details and reference information, see:
% http://www.sfu.ca/~ssurjano/
%
%
% INPUT:
%
% xx = [x1, x2, ..., xd]


d = length(xx);
sum = 0;
prod = 1;

for ii = 1:d
	xi = xx(ii);
	sum = sum + xi^2/4000;
	prod = prod * cos(xi/sqrt(ii));
end

y = sum - prod + 1;

end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y] = levy(xx)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LEVY FUNCTION
%
% Authors: Sonja Surjanovic, Simon Fraser University
%          Derek Bingham, Simon Fraser University
% Questions/Comments: Please email Derek Bingham at dbingham@stat.sfu.ca.
%
% Copyright 2013. Derek Bingham, Simon Fraser University.
%
% THERE IS NO WARRANTY, EXPRESS OR IMPLIED. WE DO NOT ASSUME ANY LIABILITY
% FOR THE USE OF THIS SOFTWARE.  If software is modified to produce
% derivative works, such modified software should be clearly marked.
% Additionally, this program is free software; you can redistribute it 
% and/or modify it under the terms of the GNU General Public License as 
% published by the Free Software Foundation; version 2.0 of the License. 
% Accordingly, this program is distributed in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
% General Public License for more details.
%
% For function details and reference information, see:
% http://www.sfu.ca/~ssurjano/
%
%
% INPUT:
%
% xx = [x1, x2, ..., xd]

d = length(xx);

for ii = 1:d
	w(ii) = 1 + (xx(ii) - 1)/4;
end

term1 = (sin(pi*w(1)))^2;
term3 = (w(d)-1)^2 * (1+(sin(2*pi*w(d)))^2);

sum = 0;
for ii = 1:(d-1)
	wi = w(ii);
        new = (wi-1)^2 * (1+10*(sin(pi*wi+1))^2);
	sum = sum + new;
end

y = term1 + sum + term3;

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



 



