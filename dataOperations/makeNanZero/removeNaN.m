function input = removeNaN(input)
input(isnan(input)) = [];
end