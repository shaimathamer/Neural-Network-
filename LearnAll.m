%% Reset and matlab configuration on error
clear;
clc;
dbstop if error

%% Adding libraries and configuration
addpath('Generate_NN_Learnt/');
addpath('NN_Utils');
addpath('BP_Functions')
nBins=10; %number of bins on embedded histogram method

%% LETTER: Size of the set: 37500
%% 2500 A, 2500 B, 2500 C, ...
%max 15 letters
%max 2500 graphs

Registers=[];
from_letter=1;
to_letter=15;
from_reg=1;
%to_reg=2500;
to_reg=25
%max_reg=2500;
max_reg=25;
for i=from_letter-1:to_letter-1
    for j=from_reg-1:to_reg-1
        Registers=[Registers i*max_reg+j+1];
    end
end

%% LETTERHIGH
% generate_NN_pattern('LETTERHIGH','NN',Registers,@NN_input);
%  generate_NN_ESB_INS_pattern('LETTERHIGH','NN_INS',Registers,@NN_INS_input);
% generate_NN_ESB_INS_pattern('LETTERHIGH','NN_ESB',Registers,@NN_ESB_input);

% generate_NN_pattern('LETTERHIGH','NeuralNet','NsubN_Histo',Registers,nBins);
% generate_NN_pattern('LETTERHIGH','NeuralNet','NsubN_Histo_EMD',Registers,nBins);
generate_NN_ESB_INS_pattern('LETTERHIGH','NeuralNet','NN_Histo_ESB',Registers,nBins);
% generate_NN_ESB_INS_pattern('LETTERHIGH','NeuralNet','NN_Histo_INS',Registers,nBins);

% generate_NN_ESB_INS_pattern('LETTERHIGH','NeuralNet','NN_Histo_ESB',Registers,nBins);
% generate_NN_ESB_INS_pattern('LETTERHIGH','NeuralNet','NN_Histo_INS',Registers,nBins);

% generate_Gaussian_Distribution('LETTERHIGH','GaussianDistribution','NN',2,Registers);
% generate_Gaussian_Distribution_ESB_INS('LETTERHIGH','GaussianDistribution','NN_INS',1,Registers);
% generate_Gaussian_Distribution_ESB_INS('LETTERHIGH','GaussianDistribution','NN_ESB',1,Registers);

%% LETTERMED
% generate_NN_pattern('LETTERMED','NN',Registers,@NN_input);
% generate_NN_ESB_INS_pattern('LETTERMED','NN_INS',Registers,@NN_INS_input);
% generate_NN_ESB_INS_pattern('LETTERMED','NN_ESB',Registers,@NN_ESB_input);

% generate_NN_pattern('LETTERMED','NeuralNet','NsubN_Histo',Registers,nBins);
% generate_NN_pattern('LETTERMED','NeuralNet','NsubN_Histo_EMD',Registers,nBins);
% generate_NN_ESB_INS_pattern('LETTERMED','NeuralNet','NN_Histo_ESB',Registers,nBins);
% generate_NN_ESB_INS_pattern('LETTERMED','NeuralNet','NN_Histo_INS',Registers,nBins);

% generate_NN_ESB_INS_pattern('LETTERMED','NeuralNet','NN_Histo_ESB',Registers,nBins);
% generate_NN_ESB_INS_pattern('LETTERMED','NeuralNet','NN_Histo_INS',Registers,nBins);

% generate_Gaussian_Distribution('LETTERMED','GaussianDistribution','NN',2,Registers);
% generate_Gaussian_Distribution_ESB_INS('LETTERMED','GaussianDistribution','NN_INS',1,Registers);
% generate_Gaussian_Distribution_ESB_INS('LETTERMED','GaussianDistribution','NN_ESB',1,Registers);

%% LETTERLOW
% generate_NN_pattern('LETTERLOW','NN',Registers,@NN_input);
% generate_NN_ESB_INS_pattern('LETTERLOW','NN_INS',Registers,@NN_INS_input);
% generate_NN_ESB_INS_pattern('LETTERLOW','NN_ESB',Registers,@NN_ESB_input);

% generate_NN_pattern('LETTERLOW','NeuralNet','NsubN_Histo',Registers,nBins);
% generate_NN_pattern('LETTERLOW','NeuralNet','NsubN_Histo_EMD',Registers,nBins);
% generate_NN_ESB_INS_pattern('LETTERLOW','NeuralNet','NN_Histo_ESB',Registers,nBins);
% generate_NN_ESB_INS_pattern('LETTERLOW','NeuralNet','NN_Histo_INS',Registers,nBins);

% generate_NN_ESB_INS_pattern('LETTERLOW','NeuralNet','NN_Histo_ESB',Registers,nBins);
% generate_NN_ESB_INS_pattern('LETTERLOW','NeuralNet','NN_Histo_INS',Registers,nBins);

% generate_Gaussian_Distribution('LETTERLOW','GaussianDistribution','NN',2,Registers);
% generate_Gaussian_Distribution_ESB_INS('LETTERLOW','GaussianDistribution','NN_INS',1,Registers);
% generate_Gaussian_Distribution_ESB_INS('LETTERLOW','GaussianDistribution','NN_ESB',1,Registers);

%% HOUSEHOTEL: Size of each set: 2627
% Registers=[1:10];
% generate_NN_pattern('HOUSEHOTEL','NN',Registers,@NN_input);
% generate_Gaussian_Distribution('HOUSEHOTEL','GaussianDistribution','NN',1,Registers);
% generate_NN_pattern('HOUSEHOTEL','NsubN_Histo',Registers,@NsubN_Histo_input);
 
%% LoadingHorse
% HOUSE
%  generate_NN_pattern_LoadHorse('house','NN',@NN_input);
% generate_NN_pattern_LoadHorse('house','NsubN_Histo',@NsubN_Histo_input);
% generate_Gaussian_Distribution_pattern_LoadHorse('house','GaussianDistribution','NN',1);

% HOUSEDISTNCE1
% generate_NN_pattern_LoadHorse('houseDistance1','NN',@NN_input);
% generate_NN_pattern_LoadHorse('houseDistance1','NsubN_Histo',@NsubN_Histo_input);
% generate_Gaussian_Distribution_pattern_LoadHorse('houseDistance1','GaussianDistribution','NN',1);

% HOTEL
% generate_NN_pattern_LoadHorse('hotel','NN',@NN_input);
% generate_NN_pattern_LoadHorse('hotel','NsubN_Histo',@NsubN_Histo_input);
% generate_Gaussian_Distribution_pattern_LoadHorse('hotel','GaussianDistribution','NN',1);

% HOTELDISTANCE1
% generate_NN_pattern_LoadHorse('hotelDistance1','NN',@NN_input);
% generate_NN_pattern_LoadHorse('hotelDistance1','NsubN_Histo',@NsubN_Histo_input);
% generate_Gaussian_Distribution_pattern_LoadHorse('hotelDistance1','GaussianDistribution','NN',1);

% NOISE
% generate_NN_pattern_LoadHorse('noise','NN',@NN_input);
% generate_NN_pattern_LoadHorse('noise','NsubN_Histo',@NsubN_Histo_input);
% generate_Gaussian_Distribution_pattern_LoadHorse('noise','GaussianDistribution','NN',1);

% ROTATE
% generate_NN_pattern_LoadHorse('rotate','NN',@NN_input);
% generate_NN_pattern_LoadHorse('rotate','NsubN_Histo',@NsubN_Histo_input);
% generate_Gaussian_Distribution_pattern_LoadHorse('rotate','GaussianDistribution','NN',1);

% SHEAR
% generate_NN_pattern_LoadHorse('shear','NN',@NN_input);
% generate_NN_pattern_LoadHorse('shear','NsubN_Histo',@NsubN_Histo_input);
% generate_Gaussian_Distribution_pattern_LoadHorse('shear','GaussianDistribution','NN',1);

%% Tarragona Rotation Zoom
% BOAT
%  generate_NN_pattern_TGNRotationZoom('BOAT_DB','NN',@NN_input);
% generate_NN_ESB_INS_patternTGNRotationZoom('BOAT_DB','NN_ESB',@NN_ESB_input,nBins);
% generate_NN_ESB_INS_patternTGNRotationZoom('BOAT_DB','NN_INS',@NN_INS_input,nBins);

% generate_NN_pattern_TGNRotationZoom('BOAT_DB','NsubN_Histo',@NsubN_Histo_input);
% generate_NN_ESB_INS_patternTGNRotationZoom('BOAT_DB','NsubN_Histo_ESB',@NsubN_Histo_ESB_input,nBins);
% generate_NN_ESB_INS_patternTGNRotationZoom('BOAT_DB','NsubN_Histo_INS',@NsubN_Histo_INS_input,nBins);

% generate_Gaussian_Distribution_pattern_TGNRotationZoom('BOAT_DB','GaussianDistribution','NN',1);

% EAST
% generate_NN_pattern_TGNRotationZoom('EAST_PARK_DB','NN',@NN_input);
% generate_NN_ESB_INS_patternTGNRotationZoom('EAST_PARK_DB','NN_ESB',@NN_ESB_input,nBins);
% generate_NN_ESB_INS_patternTGNRotationZoom('EAST_PARK_DB','NN_INS',@NN_INS_input,nBins);

% generate_NN_pattern_TGNRotationZoom('EAST_PARK_DB','NsubN_Histo',@NsubN_Histo_input);
% generate_NN_ESB_INS_patternTGNRotationZoom('EAST_PARK_DB','NsubN_Histo_ESB',@NsubN_Histo_ESB_input,nBins);
% generate_NN_ESB_INS_patternTGNRotationZoom('EAST_PARK_DB','NsubN_Histo_INS',@NsubN_Histo_INS_input,nBins);

% SOUTH
% generate_NN_pattern_TGNRotationZoom('EAST_SOUTH_DB','NN',@NN_input);
% generate_NN_ESB_INS_patternTGNRotationZoom('EAST_SOUTH_DB','NN_ESB',@NN_ESB_input,nBins);
% generate_NN_ESB_INS_patternTGNRotationZoom('EAST_SOUTH_DB','NN_INS',@NN_INS_input,nBins);

% generate_NN_pattern_TGNRotationZoom('EAST_SOUTH_DB','NsubN_Histo',@NsubN_Histo_input);
% generate_NN_ESB_INS_patternTGNRotationZoom('EAST_SOUTH_DB','NsubN_Histo_ESB',@NsubN_Histo_ESB_input,nBins);
% generate_NN_ESB_INS_patternTGNRotationZoom('EAST_SOUTH_DB','NsubN_Histo_INS',@NsubN_Histo_INS_input,nBins);

% RESID
% generate_NN_pattern_TGNRotationZoom('RESID_DB','NN',@NN_input);
% generate_NN_ESB_INS_patternTGNRotationZoom('RESID_DB','NN_ESB',@NN_ESB_input,nBins);
% generate_NN_ESB_INS_patternTGNRotationZoom('RESID_DB','NN_INS',@NN_INS_input,nBins);

% generate_NN_pattern_TGNRotationZoom('RESID_DB','NsubN_Histo',@NsubN_Histo_input);
% generate_NN_ESB_INS_patternTGNRotationZoom('RESID_DB','NsubN_Histo_ESB',@NsubN_Histo_ESB_input,nBins);
% generate_NN_ESB_INS_patternTGNRotationZoom('RESID_DB','NsubN_Histo_INS',@NsubN_Histo_INS_input,nBins);