% task made based on ex_5_general_procedure
g=@(x,k)x.*exp(k.*(1-x));
a = 1.5;
x = 3;
xx = linspace(0, 3, 1000);

plot(xx, g(xx, a), xx, xx)
hold on

% Initialize gx with the initial values
gx = g(x, a);
plot(x, gx, 'r*')
pause(0.5)

% iterate through k values from 1.5 to 2.5 with step 0.1
for k = 1.5:0.1:2.5
    % create a new figure for each k
    figure;
    a = k;
    
    x = 3;
    gx = g(x, a);
    
    % plot for initial function and start point
    plot(xx, g(xx, a), xx, xx);
    hold on;
    plot(x, gx, 'r*');
    title(['k = ', num2str(k)]);

    % cobweb 30 iterations with step 1
    for i = 1:30
        plot([x, gx], [gx, gx], 'r--*');
        pause(0.5);
        x = gx;
        gx = g(x, a);
        plot([x, x], [x, gx], 'r--*');
        pause(0.5);
        
        % print fixed points to console
        if abs(x - gx) < 0.01
            fprintf('Converged to a fixed point: x = %.4f (k = %.2f)\n', x, k);
            break;
        end
    end
    hold off;
end
hold off


%Converged to a fixed point: x = 1.0048 (k = 1.50)
%Converged to a fixed point: x = 1.0053 (k = 1.60)
%Converged to a fixed point: x = 1.0043 (k = 1.70)
%Converged to a fixed point: x = 1.0052 (k = 1.80)