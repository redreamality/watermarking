t=tcpip('127.0.0.1', 30000, 'NetworkRole', 'server');

fopen(t);
while 1
    data=fread(t, t.BytesAvailable);
    
    disp('receive successful');
end