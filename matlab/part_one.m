close all
clear variables
clc

% Importing functions from other folders
addpath(genpath('functions'));

% Converting data from text file to matlab vectores
data = load("../data/NOAAwave_1979010103to2007123121.txt");
month = data(1:end, 2);
Hs = data(1:end, 5); % Significant Height
Tp = data(1:end, 6); % Peak Periods

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 1 - Scatter Tables -> Done with Excel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 2 - Avarage wave power per unit crest length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Exercise 2.1 - Avarage wave power per unit crest length
Pw_avg = Pw_average(Tp, Hs);

% Exercise 2.2 - Average Wave Power per unit crest length per Season

% Defining arrays that will contain significant heights and peak
% periods for each season
Tp_winter = []; Hs_winter = []; Tp_summer = []; Hs_summer = [];
Tp_spring = []; Hs_spring = []; Hs_autumn = []; Tp_autumn = [];

for i = 1:length(data)
    % Append significant height and peak period to
    % the last line of corresponding season vector
    if month(i) == 12 || month(i) == 1 || month(i) == 2
        Hs_winter(length(Hs_winter) + 1) = Hs(i);
        Tp_winter(length(Tp_winter) + 1) = Tp(i);
    elseif month(i) == 6 || month(i) == 7 || month(i) == 8
        Hs_summer(length(Hs_summer) + 1) = Hs(i);
        Tp_summer(length(Tp_summer) + 1) = Tp(i);
    elseif month(i) == 3 || month(i) == 4 || month(i) == 5
        Hs_spring(length(Hs_spring) + 1) = Hs(i);
        Tp_spring(length(Tp_spring) + 1) = Tp(i);
    else
        Hs_autumn(length(Hs_autumn) + 1) = Hs(i);
        Tp_autumn(length(Tp_autumn) + 1) = Tp(i);
    endif

endfor

Pw_winter_average = Pw_average(Tp_winter, Hs_winter);
Pw_summer_average = Pw_average(Tp_summer, Hs_summer);
Pw_spring_average = Pw_average(Tp_spring, Hs_spring);
Pw_autumn_average = Pw_average(Tp_autumn, Hs_autumn);

% Exercise 2.3 - Normalized Occurrence -> Done with Excel

% Exercise 3 - Wave Energy Converters -> Done with Excel
