% Script to try to build a spanning tree generation algorithm. The
% algorithm tries to build a path towards the vertex (nx,ny) using several
% sets of trees. Technically, the tree need not be *spanning*.

nx = 10; % n.o. vertices in x dirn
ny = 10; % n.o. vertices in y dirn

G = zeros(nx,ny); % graph G with nx by ny vertices
G(1,1) = 1;
outs = zeros(size(G));
% The start vertex is (1,1)
v = [1 1];
% the nearest neighbors are labeled clockwise from top center
neisdelx = [0 1 0 -1]; % delta in index x for n.neighbors
neisdely = [1 0 -1 0]; % delta in index y for n.neighbors
countr = 0; % step counter
N = 0; % Tree counter
completeflag = false;

while ~completeflag
    N = N + 1;
    
    flag = false; % is TRUE when the algorithm hits a dead end
    % build me a tree, Noah!
    while ~flag % loop which builds a tree
        freeNNs = FindNNs(G,v); % find usable nearest neighbours     
        if isempty(freeNNs)
            flag = true; % no free NN's
        else % use rand num to pick from nearest neighbours
            r = ceil(rand(1).*length(freeNNs));
            v(1) = v(1) + neisdelx(freeNNs(r));
            v(2) = v(2) + neisdely(freeNNs(r));
            % set variables to output
            G(v(1),v(2)) = N;
            countr = countr + 1;
            outs(v(1),v(2)) = countr;
        end
    end
    % Now, if we're not at the end then generate more trees by repeating
    if G(nx,ny) ~= 0
        completeflag = true;
    else
        pickflag = false;
        % Choose a new location to start from (check it has valid spaces)
        [ro co] = find(G);
        while ~pickflag
            r2 =  ceil(rand(1).*length(ro));
            v = [ro(r2) co(r2)];
            if ~isempty(FindNNs(G,v)) % has min of one free Nearest Neighbour
               pickflag = true; 
            end
        end
        
    end
    
end