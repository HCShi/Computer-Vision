function [features, pyr, imp] = detect_features(img)
    %[features, pyr, imp] = detect_features_Harris_Laplace(img);
    [features, pyr, imp] = detect_features_DoG(img);
end  

