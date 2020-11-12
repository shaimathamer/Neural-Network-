function Generate_Neural(databaseName,NN,Registers)
%% Adding libraries
addpath('./2016_TARRAGONA_GRAPH_DATABASE');
addpath('./DDBB/Letter/');
addpath('./NN_Utils');

%% Loading data
varname=[databaseName '.mat'];
load(varname);
P=LoadAllRegisters_Learning_Selected_Registers(Database,Registers);

%% Learning Algorithm
totalFrames = size(P,2);
P1 = []; P2 = [];

for i = 1:totalFrames
    P1{i} = P{i}.graph1;
    P2{i} = P{i}.graph2;
    L{i} = rowLabelling2Mat(P{i}.graph1,P{i}.graph2,P{i}.labelling);
    L_vector{i}=P{i}.labelling;
end

fprintf('Initialising Net structure\n');

Inputs = [];
Outputs = [];

% generating the inputs for the neural network
for i = 1:length(P1)
    
    N1 = P1{i}.nodes;
    N11=[N1;0 0]
    N2 = P2{i}.nodes;
    N22=[N2;0 0]
    E1 = P1{i}.edges;
    E2 = P2{i}.edges;
    E22=zeros(size(N22,1),size(N22,1));
    E22(1:size(N2,1),1:size(N2,1))=E2;
    E11=zeros(size(N11,1),size(N11,1));
    E11(1:size(N1,1),1:size(N1,1))=E1;
    labelling = L{i}; 
    L_vectorrr=L_vector{i};
    L_vectorr=-1*ones(1,size(N22,1));
    L_vectorr(1:size(L_vectorrr,2))= L_vectorrr;
    N_lebeling=2*ones(size(N11,1),size(N22,1));
    N_lebeling(1:size(labelling,1),1:size(labelling,2))=labelling;
   
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Generting_Input_and_Output_between_2_Graph%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
   substitutionInputs2G =zeros((size(N1,1)*(size(N2,1)+1)+size(N2,1)),size(N1,2)*size(N1,2)+4);
   substitutionOutputs2G =zeros((size(N1,1)*(size(N2,1)+1)+size(N2,1)),6);

iSubstitutions = 0;
    for a = 1:size(N11,1)
        for b = 1:size(N22,1) 
               % tarrget=any(L_vectorr==b);
               
                if  N_lebeling(a,b) == 1 && b <size(N2,1)
                        iSubstitutions = iSubstitutions + 1;
                        substitutionInputs2G(iSubstitutions,1:6) = NN_input(N11(a,:),E11(a,:),N22(b,:),E22(b,:));
                        substitutionOutputs2G(iSubstitutions,1 ) = 1;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Not_true_Substitutions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                      
                 elseif  N_lebeling(a,b) == -1&& b<=size(N2,1)
                       iSubstitutions = iSubstitutions + 1;
                        substitutionInputs2G(iSubstitutions,1:6) = NN_input(N11(a,:),E11(a,:),N22(b,:),E22(b,:));
                       substitutionOutputs2G(iSubstitutions,2 ) = 1; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%True_Deletion%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%               
                elseif  N_lebeling(a,b) == 0 && b==size(N22,1)
                        iSubstitutions = iSubstitutions + 1;
                        substitutionInputs2G(iSubstitutions,1:3) = NN_INS_input(N11(b,:),E11(b,:));
                        substitutionOutputs2G(iSubstitutions,4 ) = 1;   
                        substitutionInputs2G(iSubstitutions,8)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Not_True_Deletion%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               elseif  N_lebeling(a,b) == 2 && L_vectorr(b)==-1 && a<size(N1,1)
                       iSubstitutions = iSubstitutions + 1;
                       substitutionInputs2G(iSubstitutions,1:3) = NN_INS_input(N11(a,:),E11(a,:));
                       substitutionOutputs2G(iSubstitutions,4 ) = 1;
                       substitutionInputs2G(iSubstitutions,8)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Inseration%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                elseif  N_lebeling(a,b) == 2 && a>size(N1,1)
                   if b< size(N22,1) && L_vectorr(b)==0
                       iSubstitutions = iSubstitutions + 1;
                       substitutionInputs2G(iSubstitutions,4:6) = NN_INS_input(N22(b,:),E22(b,:));
                       substitutionOutputs2G(iSubstitutions,5 ) = 1; 
                       substitutionInputs2G(iSubstitutions,7)=1; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Not_True_Inseration%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                   else   
                      %  if any(L_vectorr==b)
                       iSubstitutions = iSubstitutions + 1;
                       substitutionInputs2G(iSubstitutions,4:6) = NN_INS_input(N22(b,:),E22(b,:));
                       substitutionOutputs2G(iSubstitutions,6 ) = 1; 
                       substitutionInputs2G(iSubstitutions,7)=1;
                   end
                end
               
             
            end
      
          
    
    end
%%%%%%%%%%%%%%%%%%%%%%Add_ThE_InputS_And_Outputs%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Inputs=[Inputs; substitutionInputs2G];
    Outputs=[Outputs;substitutionOutputs2G];
    end




save(fitInName.mat,'Inputs');
save(fitOutName.mat,'Outputs');

nnstart
 

 
end