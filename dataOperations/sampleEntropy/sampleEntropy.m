function [value] = sampleEntropy(signal, m, r, dist_type)
if not(exist('m','var'))
    m = 2;
end
if not(exist('r','var'))
    r = 0.2;
end
if not(exist('dist_type','var'))
    dist_type = 'chebychev';
end
value = SampEn(signal, m, r, dist_type);
end

