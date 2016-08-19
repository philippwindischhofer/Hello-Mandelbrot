# plots the mandelbrot fractal instead of writing "hello world"

# determines the region in the complex plane (x = real, y = imag)
x_l = -2.4; x_u = 1.5;
y_l = -1.5; y_u = 1.5;

# max. number of iterations that are done, determines the quality of the image
max_iter = 50;

# spatial resolution, i.e. number of sampling points in x / y direction
res = 500;

[xx,yy] = meshgrid(linspace(x_l, x_u, res), linspace(y_l, y_u, res));

# make complex plane out of real grid
cc = xx + 1i * yy;
it = zeros(size(cc));
out = zeros(size(cc));

for i = 1:max_iter
  it = it .^ 2 + cc; # apply iteration rule
  out(it > 2 & out == 0) = max_iter - i; # assign number of iterations if it blows up at this location
end

# plot everything & get rid of the axes...
figure
imagesc(out)
colormap("ocean")
axis square
set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', []);
set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);