clc;
clear all;
close all;

alpha1_range = [0.01, 0.1];
alpha2_range = [0.01, 0.1];
beta1_range = [1, 3];
beta2_range = [1, 3];
kD_range = [0.01, 0.1]; 

num_combinations = 100;

tspan = [0, 1000];
y0 = [0.1 0.1];

params = zeros(num_combinations, 8);

figure
hold on
grid on
title('Exploration of 100 Random Parameter Combinations')

for i = 1:num_combinations
    alpha1 = rand() * (alpha1_range(2) - alpha1_range(1)) + alpha1_range(1);
    alpha2 = rand() * (alpha2_range(2) - alpha2_range(1)) + alpha2_range(1);
    beta1 = rand() * (beta1_range(2) - beta1_range(1)) + beta1_range(1);
    beta2 = rand() * (beta2_range(2) - beta2_range(1)) + beta2_range(1);
    
    kD11 = rand() * (kD_range(2) - kD_range(1)) + kD_range(1);
    kD12 = rand() * (kD_range(2) - kD_range(1)) + kD_range(1);
    kD21 = rand() * (kD_range(2) - kD_range(1)) + kD_range(1);
    kD22 = rand() * (kD_range(2) - kD_range(1)) + kD_range(1);
    
    params(i, :) = [alpha1, alpha2, beta1, beta2, kD11, kD12, kD21, kD22];
    
    [t, y] = ode45(@(t,y) zmbode(5, 5, 5, 5, kD11, kD12, kD21, kD22, beta1, beta2, alpha1, alpha2, y), tspan, y0);
    
    h = plot(t, y(:,2), 'LineWidth', 1);
    text(t(end), y(end,2), [' ' num2str(i)], 'FontSize', 8, 'Color', h.Color);
end

hold off

%% params
curve_index = 14;
alpha1 = params(curve_index, 1);
alpha2 = params(curve_index, 2);
beta1 = params(curve_index, 3);
beta2 = params(curve_index, 4);
kD11 = params(curve_index, 5);
kD12 = params(curve_index, 6);
kD21 = params(curve_index, 7);
kD22 = params(curve_index, 8);

[t, z] = ode45(@(t,y) zmbode(5, 5, 5, 5, kD11, kD12, kD21, kD22, beta1, beta2, alpha1, alpha2, y), tspan, y0);

figure
hold on
grid on
plot(t, z(:,2), 'LineWidth', 1);
plot(t, z(:,1), 'LineWidth', 1);
hold off


