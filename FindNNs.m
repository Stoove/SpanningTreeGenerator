% Function to return indices of nearest neighbours of an element in an
% array, counting them clockwise from top, and checking to ensure they are
% nonzero elements. G is the array, v is the position vector of the element

function [NNs] = FindNNs(G,v)

sz = size(G);
nx = sz(1);
ny = sz(2);

NNs = [];
if v(1)~=1
    if G(v(1)-1,v(2))==0
        NNs = [NNs 4];
    end
end
if v(2)~=1
    if G(v(1),v(2)-1)==0
        NNs = [NNs 3];
    end
end
if v(1)~=nx
    if G(v(1)+1,v(2))==0
        NNs = [NNs 2];
    end
end
if v(2)~=ny
    if G(v(1),v(2)+1)==0
        NNs = [NNs 1];
    end
end