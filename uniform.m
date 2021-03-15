n_vals = [1 2 5 10 20 40]; %n values
color=['y','b','g','c','k', 'w'];
for i=1:6 % this loop gets histogram and corresponding gaussian for different n values
    n = n_vals(i);
    A = sum(rand(n, 10000)*10-5,1); % sum of the n IID uniform r.v.
    subplot(2,3, i);
    histogram(A, 'Normalization', 'pdf', 'FaceColor', color(i));
    hold on
    x = [-5*n:.1:5*n];
    y=normpdf(x,0,sqrt(n*25/3)); % ideal gaussian for specified n values
    plot(x,y, 'r', 'LineWidth', 2);
    hold off;
    title("n= " + n)
    xlabel("sample values")
    ylabel("probability")
    legend('Uni. Sum PDF','Gaussian PDF')
end
clear A;
clear x;
clear y;