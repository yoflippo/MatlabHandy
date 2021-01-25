function angle = angleBetweenVectors(v1,v2)

dim_v1 = size(v1);
dim_v2 = size(v2);

if any( (max(dim_v1)==3) | (max(dim_v2)==3)) 
    testLayoutVectors(dim_v1,dim_v2,v1,v2,@angleBetween_3dim_2Vectors);
else
    testLayoutVectors(dim_v1,dim_v2,v1,v2,@angleBetween_2dim_2Vectors);
end

    function angle = angleBetween_3dim_2Vectors(v1,v2)
        angle = atan2d(norm(cross(v1,v2)),dot(v1,v2));
    end

    function angle = angleBetween_2dim_2Vectors(v1,v2)
        angle = acosd(dot(v1,v2)/(norm(v1)*norm(v2)));
    end

    function testLayoutVectors(dim_v1,dim_v2,v1,v2,handleAngleFunction)
        if not(any(dim_v1==1)) && not(any(dim_v2==1))
            for nA = 1:length(v1) % Assumed row-major order & v1 contains multiple vectors
                angle(nA) = handleAngleFunction(v1(nA,:),v2(nA,:));
            end
        elseif not(any(dim_v1==1))
            for nA = 1:length(v1) % Assumed row-major order & v1 contains multiple vectors
                angle(nA) = handleAngleFunction(v1(nA,:),v2);
            end
        elseif not(any(dim_v2==1))
            for nA = 1:length(v2) % Assumed row-major order & v1 contains multiple vectors
                angle(nA) = handleAngleFunction(v1,v2(nA,:));
            end
        else
            angle = handleAngleFunction(v1,v2);
        end
    end
end