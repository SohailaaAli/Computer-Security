function plaintxt = Decryption (ciphertxt ,key,size)
ciphertxt = lower(ciphertxt);
ciphertxt = ciphertxt(ciphertxt ~=' ');
key = lower (key);
key = key(key ~= ' ');
plaintxt ='';
keyMat = zeros(size ,size);
char ='a':'z';
keyCnt =1 ;
charCnt =1;
for i=1 :size
    for j=1:size
        if keyCnt> length(key)
            keyMat(i,j) = charCnt -1;
            charCnt = charCnt +1;
        else
            keyMat(i,j) = find(char == key(keyCnt))-1;
            keyCnt = keyCnt +1;
        end
    end
end
disp (keyMat);

matDet = det(keyMat);
matInv = inv(keyMat);
keyAdjugate = matDet * matInv;
keyAdjugate = mod(keyAdjugate ,26);

matDet = mod(matDet ,26);

for matDetInverse =1 : 100
    if  mod(matDet *matDetInverse ,26)==1
        break;
    end
end

keyMatInverse = keyAdjugate * matDetInverse;
keyMatInverse = mod(keyMatInverse,26);

disp (keyMatInverse);

for i=1:size :length(ciphertxt)
    cipherChar = ciphertxt(i:i + size -1);
    cipherMat = zeros(1 , size);
    for j=1 : size 
        cipherMat(j) = find(char == cipherChar(j))-1;
    end
    plainMat = keyMatInverse * cipherMat';
    plainMat = mod(int32(plainMat) ,26);
    plaintxt(i : i+size -1) = char(plainMat+1);
end
plaintxt = upper(plaintxt);

end



























