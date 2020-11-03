function [outDir] = makeFullPathFromDirOutput(in)
    outDir = in;
    for nF = 1:length(in)
        outDir(nF).fullpath = fullfile(in(nF).folder, in(nF).name);
    end
end
