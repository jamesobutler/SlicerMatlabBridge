function outputParams=MatlabBridgeParameterPassingTest(inputParams)
% Example function that returns the minimum and maximum voxel value in a volume
% and performs thresholding operation on the volume.
%
% Parameters:
%  inputParams.threshold: threshold value
%  inputParams.unnamed{1}: input image filename
%  inputParams.unnamed{2}: output image filename (value is 0 if below threshold, 100 if above threshold)
%  outputParams.min: image minimum value
%  outputParams.max: image maximum value
%  etc.
%

% Read inputs
integerValue=inputParams.integer
doubleValue=inputParams.double
floatVectorValue=inputParams.f
stringVectorValue=cli_stringvectordecode(inputParams.string_vector)
stringEnumerationValue=inputParams.enumeration
boolean1Value=isfield(inputParams,'boolean1')
boolean2Value=isfield(inputParams,'boolean2')
boolean3Value=isfield(inputParams,'boolean3')
filenameValue=inputParams.file1
filenameListValue=cli_stringvectordecode(inputParams.files)
directoryValue=cli_stringvectordecode(inputParams.directory1)
imageValue=cli_imageread(inputParams.image1)
transformValue=cli_lineartransformread(inputParams.transform1)
seedValue=inputParams.seed
inputMeasurementFilenameValue=cli_measurementread(inputParams.inputFA)
unnamedInputImageValue=cli_imageread(inputParams.unnamed{1});
surfaceMeshValue=cli_geometryread(inputParams.inputSurfaceMesh);

% Write outputs
outputParams.anintegerreturn=integerValue*10;
outputParams.abooleanreturn=boolean1Value && boolean2Value && boolean3Value;
outputParams.afloatreturn=123.456;
outputParams.adoublereturn=246.81012;
outputParams.astringreturn=['the input was ' stringEnumerationValue];
outputParams.anintegervectorreturn=floatVectorValue*2;
outputParams.astringchoicereturn=stringEnumerationValue;

cli_imagewrite(inputParams.image2, imageValue); % Write the input image on the output unchanged
cli_lineartransformwrite(inputParams.transform2,transformValue); % Write the input transform on the output unchanged
cli_imagewrite(inputParams.unnamed{2},unnamedInputImageValue); % Write the input image on the output unchanged
cli_measurementwrite(inputParams.outputFA, [inputMeasurementFilenameValue; 1 2 0.2; 2 4 0.3; 3 5 0.2]); % Write the input image on the output with a few extra numbers added
cli_geometrywrite(inputParams.outputSurfaceMesh, surfaceMeshValue); % Write the input surface mesh on the output unchanged
