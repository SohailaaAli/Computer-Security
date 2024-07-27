function result = keygen ( key)
keyBits = key ;
if keyBits >64
    keyBits = keyBits(1:64);
elseif keyBits <64
    repeat = ceil(64 / length(keyBits));
    keyBits =repmat(keyBits,1,repeat);
end

X = keyBits(1: 19);
Y = keyBits(20: 41);
Z = keyBits(42 : 64);


keyStream = zeros(1,length(keyBits));

for i=1 : length(keyBits)
    m = maj(X(8) ,Y(10),Z(10));
    if X(8) == m
        t = bitxor(bitxor(X(13),X(16)),bitxor(X(17),X(18)));
        X = [t,X(1: 18)];
    end
    if Y(10) == m
        t = bitxor(Y(20),Y(21));
        Y = [t,Y(1: 21)];
    end
    if X(10) == m
        t = bitxor(bitxor(Z(7),Z(20)),bitxor(Z(21),Z(2)));
        Z = [t,Z(1: 22)];
    end
    keyStream(i)= bitxor(bitxor(X(8),Y(10)),Z(10));
end
result = keyStream;
end

function m = maj(a,b,c)
m = a&b | b&c | a&c;
end