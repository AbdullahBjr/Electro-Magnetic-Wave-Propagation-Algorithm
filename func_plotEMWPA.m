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

function func_plotEMWPA(func_name)

[lb,ub,dim,fobj]=Get_Functions_detailsEMWPA(func_name);

switch func_name 
    case 'F1' 
        x=-40:0.1:40; y=x; %[-100,100] xi ∈ [-32.768, 32.768]
        
    case 'F2' 
        x=-15:0.1:5; y=x; %[-100,100]  x1 ∈ [-15, -5], x2 ∈ [-3, 3].
        
    case 'F3' 
        x=-50:0.1:50; y=x;%[-50,50]
        
    case 'F4' 
        x=-10:0.1:10; y=x; %[-100,100]
                             
end    

Lx=length(x);
Ly=length(y);
f=[];

for i=1:Lx
    for j=1:Ly    

          %  F6 Rastrigin Function, F18 Power Sum Function, 27 Colville Function
          if     strcmp(func_name,'F6')==0 && strcmp(func_name,'F18')==0 && strcmp(func_name,'F27')==0 && strcmp(func_name,'F30')==0 && strcmp(func_name,'F32')==0 && strcmp(func_name,'F33')==0 && strcmp(func_name,'F35')==0
                 f(i,j)=fobj([x(i),y(j)]);
         end
         
         % % F18 Power Sum Function, F27 Colville Function, F30 Powell Function
         % if strcmp(func_name,'F18')==1 || strcmp(func_name,'F27')==1 || strcmp(func_name,'F30')==1 
         %    f(i,j)=fobj([x(i),y(j),0,0]);
         % end  

         % if  strcmp(func_name,'F32')==1  || strcmp(func_name,'F33')==1 || strcmp(func_name,'F35')==1          
         % 
         %     f(i,j)=fobj([x(i),y(j),x3,x4]);        %f32,f33,f35
         % 
         % end 


    end
            if strcmp(func_name,'F6')==1 
            f(i)=fobj([x(i)]);
            end

end
           if strcmp(func_name,'F6')==1      %   ft = @(t) (sin(10*pi*t) / (2*t))+ ((t-1)^4);
               plot(x,f)                                                     %  fplot(ft,[0.5 2.5])
         
           else   

           surfc(x,y,f,'LineStyle','none');    

           end

end