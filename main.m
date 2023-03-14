
clc; clear;
%% intitializing
fig_name = 'Fig.png';  %%%%///// change file name here
file_type = 'png';

dat = 'data/';

source  =  strcat(dat,fig_name) ;


fig = imread(source,file_type); %%%% //// change png to jpg for jpg file
fig =  im2gray(fig) ;

rows = size(fig,1) ;
col = size(fig, 2) ;
%imshow(fig)

fig = double(fig)/1;

T = 0.03;  % threshhold value  can be changes accordingly, it is in decimal ratio value
B = 3;  % border side length ; for 3*3 - 3 and 5*5 - 5 ; should be odd and >2


R = median_filter(fig, rows,col, T , 3 );
R = median_filter(R, rows,col, T , 3 );



fig= uint8(fig) ;
%imshow(fig)

% Typecasted to uint8 
output = uint8(R); 
% Display your image
output; imshow(output,[]);
%imshow(fig)
%imshow(R)


