function [dydt] = zmbode(n11, n12, n21, n22, kD11, kD12, kD21, kD22, beta1, beta2, alpha1, alpha2, y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
dydt = zeros(2,1);
dydt(1) = beta1 * (y(1)^n11/(y(1)^n11 + kD11^n11)) * (1/(1 + (y(2)/kD21)^n21)) - alpha1*y(1);
dydt(2) = beta2 * (y(1)^n12/(y(1)^n12 + kD12^n12)) * (1/(1 + (y(2)/kD22)^n22)) - alpha2*y(2);
end

