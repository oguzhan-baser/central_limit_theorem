n_vals = [1 2 5 10 20 40];%n values
color=['y','b','g','c','k', 'w'];
for i=1:6% this loop gets cdf histogram and corresponding gaussian for different n values
    n = n_vals(i);
    A = sum(poissrnd(1, n, 10000), 1);
    subplot(2,3, i);
    histogram(A, 'Normalization', 'cdf', 'FaceColor', color(i));
    hold on
    cdfplot(A);% plots seperate CDF of the random variable sum to show impulses at the right place/x-value
    hold on
    x = [-0.5:.1:sqrt(n)*9];
    y=normcdf(x,n,sqrt(n));
    plot(x,y, 'r', 'LineWidth', 2);
    hold off;
    title("n= " + n)
    xlabel("sample values")
    ylabel("probability")
    legend('Poiss. Sum Hist.', 'Poiss. Sum CDF','Gaussian CDF', 'Location', 'southeast')
end
%sets the memory free
clear A;
clear x;
clear y;