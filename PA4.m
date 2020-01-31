%%PA4 Laplace

N=10;            %number variables
iterations=10;   %number iterations
steps=N*N;

V=zeros(N,N);         %matrix V (nx,ny)
% boundary conditions
left_BC = 1; % V
right_BC = 1; % V/m
top_BC = 0; % V/m
bottom_BC = 0; % V/m

V(1,:) = top_BC;
V(N,:) = bottom_BC;
V(:,1) = left_BC;
V(:,N) = right_BC;

while (steps >0)
    steps=steps-1;
    for i=2:(N-1)
        for j=2:(N-1)
            V(i,j)=((V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4);
        end
    end
    figure(1)
    surf(V);
    xlim([1 N]);
    ylim([1 N]);
    
    [X Y]=gradient(V);
    
    figure(2)
    Magnetic=sqrt(X.^2 + Y.^2);
    surf(Magnetic);

   figure(3)
   quiver(X,Y);
end

    