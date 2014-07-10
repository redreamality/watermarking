% client
data='qiwfnzkjnqeaXf';


t=tcpip('127.0.0.1', 30000, 'NetworkRole', 'client');
fopen(t)
while 1
    fwrite(t, data)
    disp('sent successful');
    pause();
    
end