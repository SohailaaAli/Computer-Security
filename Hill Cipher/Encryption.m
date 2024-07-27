function ciphertxt = Encryption(plaintxt,key ,size)
plaintxt = lower(plaintxt);
plaintxt = plaintxt(plaintxt~=' ');
key = lower(key);
key = key(key ~= ' ');
char = 'a':'z';
keyMat = zeros(size ,size);
keyCnt =1;
charCnt =1;
for i=1: size
    for j=1 :size
        if keyCnt >length(key)
            keyMat(i,j) = charCnt -1;
            charCnt = charCnt +1;
        else
            keyMat(i,j) = find(char == key(keyCnt))-1;
            keyCnt = keyCnt + 1;
        end
    end
    disp(keyMat);
end

div = length(plaintxt)\size ;
if div ~= 0
    for i=div: size -1
        plaintxt = strcat(plaintxt ,'x');
    end
end

disp(plaintxt);
cipherMat = zeros(size,1)
for i=1 : size : length(plaintxt)
    plainChars = plaintxt(i : i+size -1);
    plainMat = zeros(1,size);
    for j=1: size
        plainMat(j) = find(char == plainChars(j))-1;
    end
    cipherMat = keyMat * plainMat' ;
    cipherMat = mod(cipherMat ,26);
    ciphertxt(i : i+size - 1) = char(cipherMat+1);
end
ciphertxt = upper(ciphertxt);
end