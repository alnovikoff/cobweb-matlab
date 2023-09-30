g = @(x, k) x .* exp(k .* (1 - x));
x0 = 3;
% values of k from 1.5 to 2.5 with step 0.01
k_vals = linspace(1.5, 2.5, 101);

% init an arrays to store results
x_res = zeros(20, numel(k_vals));
k_res = zeros(20, numel(k_vals));

for k_idx = 1:numel(k_vals)
    k = k_vals(k_idx);
    x = x0;
    
    % perform 30 iterations
    for i = 1:30
        gx = g(x, k);
        x = gx;
        
        % store the last 20 values
        if i >= 11
            x_res(i - 10, k_idx) = x;
            k_res(i - 10, k_idx) = k;
        end
    end
end

% define specific y-axis and x-axis values
y_values = [0, 0.5, 1, 1.5, 2];
x_values = [1.5, 2, 2.5];

% plot the last 20 iteratoons for each value of k with specific axes values
figure;
plot(k_res, x_res, 'b*');
xlabel('k');
ylabel('x');
title('20 iterations');
grid off;
set(gca, 'YTick', y_values, 'XTick', x_values);
ylim([0, 2]); 
xlim([1.5, 2.5]); 
yticks(y_values);
xticks(x_values);