function output = MakeColumnVector(varargin)
% MAKECOLUMNVECTOR  - Deze eenvoudige functie test of de kolommen langer zijn dan de
%                     rijen. Zoniet dan maakt hij van de rijvectoren
%                     kolomvectoren.
% INPUT:
%   argument 1  : Data die mogelijk als rijvector is ingedeeld.
%
% OUTPUT:
%   Een kolomvector
%
% MS2013 (m.j.a.j.schrauwen@hhs.nl)

% $Revisie: 1.0.0.0 $  $Datum: 2013-11-28 $

%% Testen op juiste input
maxarg = 1;
minarg = 1;
if nargin < minarg
    error(['Stuur minimaal ' minarg ' argumenten mee (zie help)']);
end
if nargin > maxarg
    error(['Stuur maximaal '  maxarg ' argumenten mee (zie help)s']);
end

[l w] = size(varargin{1});
if l<w 
    output = varargin{1}';
else
    output = varargin{1};
end