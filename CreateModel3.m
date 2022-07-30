function model=CreateModel3()

    H = imread('ChrismasTerrain.tif'); % Get elevation data
    H (H < 0) = 0;
    MAPSIZE_X = size(H,2); % x index: columns of H
    MAPSIZE_Y = size(H,1); % y index: rows of H
    [X,Y] = meshgrid(1:MAPSIZE_X,1:MAPSIZE_Y); % Create all (x,y) points to plot
    
    % Map limits
    xmin= 1;
    xmax= MAPSIZE_X;
    
    ymin= 1;
    ymax= MAPSIZE_Y;
    
    zmin = 100;
    zmax = 200;  
    
    % Threats as cylinders
    R1=30;  % Radius
    x1 = 400; y1 = 500; z1 = 100; % center

    R2=35;  % Radius
    x2 = 600; y2 = 200; z2 = 150; % center

    R3=35;  % Radius
    x3 = 500; y3 = 350; z3 = 150; % center

    R4=40;  % Radius
    x4 = 350; y4 = 200; z4 = 150; % center

    R5=45;  % Radius
    x5 = 800; y5 = 550; z5 = 150; % center

    R6=30;  % Radius
    x6 = 750; y6 = 750; z6 = 150; % center
    
    R7=25;  % Radius
    x7 = 200; y7 = 300; z7 = 150; % center
    
    R8=40;  % Radius
    x8 = 300; y8 = 500; z8 = 150; % center
    
    R9=50;  % Radius
    x9 = 650; y9 = 550; z9 = 150; % center
    
    R10=25;  % Radius
    x10 = 600; y10 = 720; z10 = 150; % center
    
    R11=30;  % Radius
    x11 = 400; y11 = 780; z11 = 150; % center
    
    R12=35;  % Radius
    x12 = 580; y12 = 60; z12 = 150; % center
 
    % Start and end position
    start = [200,100,100];
    start(3) = start(3) + H(round(start(2)),round(start(1)));
    
%     goals = [[700,200,150];
%              [900,500,150];
%              [800,800,150];
%              [500,700,150]];
%          
%     for i = 1:size(goals,1)
%         goals(i,3) = goals(i,3) + H(round(goals(i,2)),round(goals(i,1)));
%     end

    goal = [800,850,150];
    goal(3) = goal(3) + H(round(goal(2)),round(goal(1)));
    
    % Incorporate map and searching parameters to a model
    model.start = start;
    model.goal = goal;
    
    model.xmin=xmin;
    model.xmax=xmax;
    model.ymin=ymin;
    model.ymax=ymax;
    model.zmin=zmin;
    model.zmax=zmax;
    
    model.MAPSIZE_X = MAPSIZE_X;
    model.MAPSIZE_Y = MAPSIZE_Y;
    
    model.X = X;
    model.Y = Y;
    model.H = H;
    model.threats = [x1 y1 z1 R1;x2 y2 z2 R2; x3 y3 z3 R3; x4 y4 z4 R4; ...
        x5 y5 z5 R5;x6 y6 z6 R6; x7 y7 z7 R7; x8 y8 z8 R8; x9 y9 z9 R9; ...
        x10 y10 z10 R10; x11 y11 z11 R11; x12 y12 z12 R12];
end

