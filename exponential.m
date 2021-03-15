n_vals = [1 2 5 10 20 40]; %n values
color=['y','b','g','c','k', 'w'];
for i=1:6 % this loop gets histogram and corresponding gaussian for different n values
    n = n_vals(i);
    A = sum(exprnd(1, n, 10000),1); % sum of IID exp. r.v.s
    subplot(2,3, i);
    histogram(A, 'Normalization', 'pdf', 'FaceColor', color(i));
    hold on
    x = [0:.1:10*sqrt(n)];
    y=normpdf(x,n,sqrt(n)); % ideal Gaussian for specified n
    plot(x,y, 'r', 'LineWidth', 2);
    hold off;
    title("n= " + n)
    xlabel("sample values")
    ylabel("probability")
    legend('Exp. Sum PDF','Gaussian PDF')
end
% sets the memory free
clear A;
clear x;
clear y;