function input = makeNaNZero(input)
input(isnan(input)) = 0;
end