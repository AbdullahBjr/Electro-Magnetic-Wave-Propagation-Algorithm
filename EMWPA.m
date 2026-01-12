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


function [Target_fitness,Target_position,Convergence_curve, elapsedTime]= EMWPA(N,Max_iteration,lb,ub,dim,fobj, Position)

display('EMWPA is optimizing the problem');

tic

% Parameters
  nPop=N;      %% No. of population
  VarMin=lb;
  VarMax=ub;
  VarSize=[1 dim];
  ProbSwitch=0.3;   
        
  Emax=3;
  Bmax=1;
  omega=4;
  lambda=4000;

% Initialize Target
        Target_position=unifrnd(VarMin,VarMax,VarSize);
        Flag4ub= Target_position>ub;
        Flag4lb= Target_position<lb;
        Target_position= ( Target_position.*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        Target_fitness=fobj(Target_position);
        


 X=ones(nPop,dim);
Convergence_curve=zeros(1,Max_iteration);
Objective_values = zeros(1,size(X,1));

% Calculate the fitness of the first set and find the best one
    for i=1:nPop
     
       X(i,:)= Position(i,:); 
       Objective_values(1,i)=fobj(X(i,:));
       if Objective_values(1,i)<Target_fitness
        Target_position=X(i,:);
        Target_fitness=Objective_values(1,i);
       end
    end   

maxrun=1;
for runs=1:maxrun 

% Main loop   
alpha=2*pi/lambda+pi;

for t=1:Max_iteration
    

        %Emax=2-t*((2)/Max_iteration);   %%%%%%  a = 2; r1=a-t*((a)/Max_iteration); % r1 decreases linearly from a to 0
        %Bmax=3-t*((3)/Max_iteration)
        % Ey=(Emax*cos(omega*t-2*pi/lambda+pi));    %Eq (3)
        % Bz=(Bmax*cos(omega*t-2*pi/lambda+pi));    %Eq (4)

        Ey=(Emax*cos(omega*t-alpha));    %Eq (3)      %  alpha=2*pi/lambda+pi;
        Bz=(Bmax*cos(omega*t-alpha));    %Eq (4)
  
% Update the position of solutions with respect to destination

    for i=1:size(X,1) % in i-th solution

           beta=unifrnd(0.7,+1,VarSize);

                 if rand<ProbSwitch
                % Eq. (1)

                  X(i,:)= (( beta.*Ey).*(Target_position(1,:)-X(i,:)))+X(i,:);

                  else
                 % Eq. (2)
                  X(i,:)= (( beta.*Bz).*(Target_position(1,:)-X(i,:)))+X(i,:);
                 end

        % Check if solutions go outside the search spaceand bring them back
        Flag4ub=X(i,:)>ub;
        Flag4lb=X(i,:)<lb;
        X(i,:)=(X(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        
        % Calculate the objective values
        Objective_values(1,i)=fobj(X(i,:));
        
        % Update the destination if there is a better solution
        if Objective_values(1,i)<Target_fitness
            Target_position=X(i,:);
            Target_fitness=Objective_values(1,i);
        end
            
  end

    Convergence_curve(t)=Target_fitness;
    
    % % Display the iteration and best optimum obtained so far
    % if mod(t,50)==0
    %     display(['At iteration ', num2str(t), ' the optimum is ', num2str(Target_fitness)]);
    % end
    % Increase the iteration counter
    % t=t+1;
     end
end
elapsedTime =toc;
end

