function signalFiltered = LPF_butter(Signal,Fs,Fc,order)
% LPF_BUTTER simple efficient Butterworth LPF filter, which save it
% settings if not changed for speed.
%
% ------------------------------------------------------------------------
%    Copyright (C) 2019  M. Schrauwen (markschrauwen@gmail.com)
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
% ------------------------------------------------------------------------
%
% DESCRIPTION:
%
%
% BY: 2019  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               Signal: the signal to be fitlered
%               Fs: the sample frequency of 'Signal'
%               Fc: the cuttoff frequency
%               order: the order of the Butterworth filter
%
% RETURN:
%               signalFiltered: the filtered signal
%
% EXAMPLES:
%               sig = randn(1,10);
%               sigfil = LPF_butter(sig,10,2,2);
%               plot(sig); hold on; plot(sigfil);

% $Revision: 0.0.0 $  $Date: 2019-06-08 $
% Creation of this function.

ap.Old = pwd;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile);
nm.Mat = [nm.CurrFile '.mat'];

var.Fs = Fs;
var.Fc = Fc;
var.order = order;

m = matfile(nm.Mat);
if ~exist(nm.Mat,'file') || ~isequal(m.var,var)
    [var.b,var.a] = butter(order,Fc/Fs,'low');
    save(nm.Mat);
else
    load(nm.Mat,'var');
end

signalFiltered = filtfilt(var.b,var.a,Signal);
cd(ap.Old);

