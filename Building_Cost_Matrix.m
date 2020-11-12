function [Cost_Matrix]=Building_Cost_Matrix(databaseName,Registers)
%%%%%%%%This Function To build the cost Matrix%%%%%%%%%%% 
%%%acording to nural network%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%This Function To build the cost Matrix%%%%%%%%%%% 
%%%acording to nural network%%%%%%%%%%%%%%%%%%%%%%%%
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
Outputs = zeros(1,8);

% generating the inputs for the neural network

for i = 1:length(P1)
    
    N1 = P1{i}.nodes;
    N2 = P2{i}.nodes;
    E1 = P1{i}.edges;
    E2 = P2{i}.edges;
    labelling = L{i};
    Q1=[];
    Q2=[];
%%%%%%%%%%%%%%%%%%%%%%Building_The_Fisrt_Q1 Substitutions%%%%%%%%%%%%%%%%%%%%%%
   iSubstitutions=0;   
   for a = 1:size(N1,1)
        for b = 1:size(N2,1) 
                   output=[];
                   
                   iSubstitutions = iSubstitutions + 1;
                   Outputs(iSubstitutions,1:6) =NN_input(N1(a,:),E1(a,:),N2(b,:),E2(b,:));
                   output=myNeuralNetworkFunction(Outputs);
                   C =max(output);
                   C11= 1-C
                   Q1(a,b)=C11;
        end
   end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Building_The_Secound Q2 Insertion%%%%%%%%%%%%%%
     iSubstitutions=0; 
     Q2=ones(size(N1,1));
    for a = 1:size(N1,1)
        
                 output=[];
                   
                   iSubstitutions = iSubstitutions + 1;
                   Outputs(iSubstitutions,1:3) =NN_INS_input(N1(a,:),E1(a,:));
                   output=myNeuralNetworkFunction(Outputs(iSubstitutions,:));
                   C =max(output);
                   C11= 1-C
                   VV(iSubstitutions)= C11;
                   if a==size(N1,1)
                        for jj=1:size(N1,1)
                            k=min(VV);
                            Q2(jj,jj)= k;
                        end
                   end
                   
   end
 %%%%%%%%%%%%%%%%%%%%%%%%%Building_The_Third Q3 Deletion%%%%%%%%%%%%%%%%%%%
     iSubstitutions=0; 
     Q3=ones(size(N2,1));
    for a = 1:size(N2,1)
        
                 output=[];
                   
                   iSubstitutions = iSubstitutions + 1;
                   Outputs(iSubstitutions,1:3) =NN_INS_input(N2(a,:),E2(a,:));
                   output=myNeuralNetworkFunction(Outputs(iSubstitutions,:));
                   C =max(output);
                   C11= 1-C
                   VV(iSubstitutions)= C11;
                   if a==size(N2,1)
                        for jj=1:size(N2,1)
                            k=min(VV);
                            Q3(jj,jj)= k;
                        end
                   end
    end
    
 %Concatenate the four matrices 
 T=size(N1,1);
 H=size(N2,1);
Q4=zeros(H,T);
QT=cat(1,Q1,Q3); Q2=cat(1,Q2,Q4);
Cost=cat(2,QT,Q2);
Cost_Matrix{i}=Cost;
   
end