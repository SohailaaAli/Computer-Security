function ciphertxt = Encryption(plaintxt,key)
plaintxt = lower(plaintxt);
plaintxt =plaintxt(plaintxt ~=' ');
key = lower(key);
key =key(key ~=' ');
char ='a':'z';
for i=1: length(plaintxt)
    plainInd =find(char ==plaintxt(i));
    keyInd = find(char == key(i));
    cipherInd = mod(plainInd + keyInd -2, 26) + 1; 
    ciphertxt(i) = char(cipherInd);
end
end