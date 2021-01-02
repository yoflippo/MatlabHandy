function angle = angleBetweenVectors(v1,v2)

if not(any(size(v1)==1))
    for nA = 1:length(v1) % Assumed row-major order & v1 contains multiple vectors
        angle(nA) = angleBetween2Vectors(v1(nA,:),v2);
    end
else
    angle = angleBetween2Vectors(v1,v2);
end

    function angle = angleBetween2Vectors(v1,v2)
        angle = atan2d(norm(cross(v1,v2)),dot(v1,v2));
    end
end