%% Reset and matlab configuration on error
clear;
clc;
dbstop if error

%% Adding libraries and configuration
addpath('Evaluate_NN_Learnt/');
addpath('NN_Utils');
nBins=10; %number of bins on embedded histogram method

%% LETTER
% %max 15 letters
% %max 50 reg per letter
% %max 50 correspondeces per reg
from_letter=1;
to_letter=15;
from_letter_reg=1;
to_letter_reg=5;
K=1;

Registers=[];
for i=from_letter-1:to_letter-1
    for j=from_letter_reg-1:to_letter_reg-1
        Registers=[Registers i*50+j+1];
    end
end

  evaluateNet_pattern('LETTERLOW',Registers,1,50,0.2); 
% evaluateNet_pattern('LETTERMED',Registers,1,50,1); 
%  evaluateNet_pattern('LETTERHIGH',Registers,1,50,1); 

%% HOSEHOTEL
% max 37 correspondeces
%  Registers=[1:10];
%  K=1000000; %Inf
%  evaluateNet_pattern('HOUSEHOTEL',Registers,1,10,1000000);

%% HOUSE ----------------------------------------
%   K=1000000; %Inf
%   evaluateNet_pattern_LoadHorse('house',K);

%  K=1000000; %Inf
%  evaluateNet_pattern_LoadHorse('houseDistance1',K);
 
% HOTEL
%  K=1000000; %Inf
% evaluateNet_pattern_LoadHorse('hotel',K);

%  HOTEL
%  K=1000000; %Inf
%  evaluateNet_pattern_LoadHorse('hotelDistance1',K);

 % NOISE
%  K=1000000; %Inf
% evaluateNet_pattern_LoadHorse('noise',K);

 % ROTATE
%  K=1000000; %Inf
% evaluateNet_pattern_LoadHorse('rotate',K);

 % SHEAR
%  K=1000000; %Inf
%  evaluateNet_pattern_LoadHorse('shear',K);

%% TGN ROTATION ZOOM ----------------------------------------
K=1000000; %Inf
%  evaluateNet_pattern_TGNRotationZoom('BOAT_DB',K);
 evaluateNet_pattern_TGNRotationZoom_MPE('BOAT_DB',K);
 
%   K=1000000; %Inf
%  evaluateNet_pattern_TGNRotationZoom('EAST_PARK_DB',K);
 evaluateNet_pattern_TGNRotationZoom_MPE('EAST_PARK_DB',K);


%   K=1000000; %Inf
%  evaluateNet_pattern_TGNRotationZoom('EAST_SOUTH_DB',K);
evaluateNet_pattern_TGNRotationZoom_MPE('EAST_SOUTH_DB',K);

% 
%   K=1000000; %Inf
%  evaluateNet_pattern_TGNRotationZoom('RESID_DB',K);
evaluateNet_pattern_TGNRotationZoom_MPE('RESID_DB',K);
