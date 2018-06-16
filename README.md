1.Harris-Laplace检测子由KeypointDetect文件夹中的detect_features_Harris_Laplace.m文件实现，同时KeypointDetect文件夹中的detect_features.m文件可以切换使用DoG检测子或者使用Harris-Laplace检测子，运行SIFTTester.m文件实现检测子的可视化；
2.在每一幅图像中，对每个关键点提取待拼接图像的SIFT描述子，由SIFTDescriptor.m文件实现该操作，运行EvaluateSIFTDescriptor.m文件可以检查实现结果；
3.比较来自两幅不同图像的SIFT描述子，寻找匹配关键点，由SIFTSimpleMatcher.m文件计算两幅图像SIFT描述子间的Euclidean距离，实现该操作，运行EvaluateSIFTMatcher.m文件检查实现结果，运行MatcherTester.m文件将匹配结果可视化；
4.基于图像中的匹配关键点，对两幅图像进行配准。ComputeAffineMatrix.m文件实现使用最小二乘法的操作，运行EvaluateAffineMatrix.m文件检查实现结果，RANSACFit.m 文件中的ComputeError()函数实现RANSAC方法估计两幅图像间的变换矩阵操作，运行TransformationTester.m文件检查实现结果；
5.基于变换矩阵，对其中一幅图像进行变换处理，将其与另一幅图像进行拼接，并对同一场景的多幅图像进行上述操作，实现场景的全景图拼接。MultipleStitch.m文件中的makeTransformToReferenceFrame函数实现该操作，可以运行StitchTester.m查看拼接结果。
Ps：以上在运行文件的时候可以修改detect_features.m文件切换使用的检测子或者直接在要运行的文件中修改调用检测子的文件的方法。


