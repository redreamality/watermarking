%% Test QR encoding and decoding
% 
% Please download and build the core and javase parts of zxing
% from here - http://code.google.com/p/zxing/

javaaddpath('.\zxing-1.7-core.jar');
javaaddpath('.\zxing-1.7-javase.jar');

% encode a new QR code
% test_encode = encode_qr('la la la', [32 32]);
% figure;imagesc(test_encode);axis image;

% decode
% pic = imread('test_qr.jpg');
pic = imread('Snapshot_20140326.jpg');
message = decode_qr(pic)
