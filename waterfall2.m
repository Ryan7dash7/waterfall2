function h = waterfall2(varargin)
%WATERFALL2 2-D waterfall plot.
%   WATERFALL2(...) is the same as WATERFALL(...) except that the row lines
%   of the mesh are drawn in the same plane. The y-axis tick values for
%   each row line are determined by Y. For column-oriented data analysis,
%   use WATERFALL2(Z') or WATERFALL2(X',Y',Z').
%
%   See also WATERFALL.

%   Version 2017.05.08
%   Copyright 2017 Ryan McGowan

if nargin < 1
    error('Not enough input arguments.');
elseif nargin > 4
    error('Too many input arguments.');
end

if nargin == 1
    z = varargin{1};
    c = z;
    x = 1:size(z,2);
    y = 1:size(z,1);
elseif nargin == 2
    z = varargin{1};
    c = varargin{2};
    x = 1:size(z,2);
    y = 1:size(z,1);
elseif nargin == 3
    [x,y,z] = varargin{1:3};
    c = z;
elseif nargin == 4
    [x,y,z,c] = varargin{1:4};
end
if min(size(x)) == 1 || min(size(y)) == 1
    [x,y] = meshgrid(x,y);
end

% Center traces around zero
z_centered = z-mean(z,2);

% Offset traces from zero based on y
z_offset = z_centered+y;

% Create the plot
hp = plot(x(1,:),z_offset);
yticks(y(:,1))

% Return handles, if requested
if nargout > 0
    h = hp;
end
end

