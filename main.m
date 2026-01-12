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
%__________________________________________________________________________
% You can simply define your cost function in a seperate file and load its handle to fobj 
% The initial parameters that you need are:
% fobj = @YourCostFunction  %% Cost/Objective Fuction
% dim = number of your decision variables
% Max_iteration = maximum number of iterations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% =========================================================================

clear all;
close all;
clc;

%% Problem Definition
Function_name  = 'F4';  % Name of the test function that can be from F1 to F30 (Table 1,2 in the paper)
Max_iteration  = 10;   % Maximum numbef of iterations
nPop           = 30;     % Number of search agents/ Number of population

%% Get Function Details
[lb, ub, dim, fobj] = Get_Functions_detailsEMWPA(Function_name);  % Details of the selected benchmark function
VarSize = [1 dim];

%% Initialize Population
popPos = zeros(nPop, dim);

for i = 1:nPop
    popPos(i,:) = unifrnd(lb, ub, VarSize);
    Flag4ub = popPos(i,:) > ub;
    Flag4lb = popPos(i,:) < lb;
    popPos(i,:) = (popPos(i,:) .* ~(Flag4ub + Flag4lb)) + ub .* Flag4ub + lb .* Flag4lb;
end

%% Run EMWPA
[bestFit, bestPos, convCurve, elapsedTimeEMWPA] = EMWPA(nPop, Max_iteration, lb, ub, dim, fobj, popPos);

%% Visualization
figure('Position',[284 214 660 290])

subplot(1,2,1);
func_plotEMWPA(Function_name);
title('Test Function');
xlabel('x_1'); ylabel('x_2');
zlabel([Function_name,'(x_1,x_2)']);
grid off;

subplot(1,2,2);
semilogy(convCurve,'g');
title('Convergence Curve');
xlabel('Iteration'); ylabel('Best Fitness');
grid off;


%% Results
disp(['Best solution obtained by EMWPA: ', num2str(bestPos)]);
disp(['Best objective value found by EMWPA: ', num2str(bestFit)]);

BestPosition = bestPos;
BestCost     = bestFit;
elapsedTime  = elapsedTimeEMWPA;

BestCostNormalized    = rescale(BestCost,0,1);
elapsedTimeNormalized = rescale(elapsedTime,0,1);