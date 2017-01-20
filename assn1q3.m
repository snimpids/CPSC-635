%% Haar decomposition of noisy sine curve.
clear;

% Setting parameters.
T = 1024;
N = 5;

% Setting domain and generating noisy sine data.
t = (0:2*pi/(T-1):2*pi);
f = sin(t)+randn(1,T)/10;

% Obtaining the H matrix.
H = haarM(T,N);

% Performing the Haar decompositions.
F = H*f';

% Plotting the result.
subplot(2,1,1);plot(t,F); axis([0, 2*pi, (min(F)-0.1), (max(F)+0.1)]);
title('5 Haar decompositions of a noisy sine curve');

%% Haar composition
% Here we compose the high frequency data from above with a noisy cosine
% curve.

% Setting up the domain and generating noisy cosine data.
U = 32;
u = (0:2*pi/(U*U-1):2*pi/U);
g = cos(u)+randn(1,U)/10;

% Appending the high frequency sine noise to the cosine curve.
G = zeros(1,T);
G(1:U) = g; 
G(U+1:T) = F(U+1:T);

% Performing the composition.
HG = inv(H)*G';

% Plotting the result.
subplot(2,1,2);plot(t,HG);axis([0,2*pi,min(HG),max(HG)]);
title({['5 Haar compositions of noisy cosine curve with'],...
    ['high frequency noisy sine curve data']});
