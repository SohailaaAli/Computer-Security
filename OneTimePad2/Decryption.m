function plaintxt = Decryption(ciphertxt,key)
ciphertxt = lower(ciphertxt);
ciphertxt =ciphertxt(ciphertxt ~=' ');
key = lower(key);
key =key(key ~=' ');
char ='a':'z';
for i=1: length(ciphertxt)
     cipherInd = find(char == ciphertxt(i));
     keyInd = find(char == key(i))
     plainInd = mod(cipherInd - keyInd ,26)+1;
     plaintxt(i) = char(plainInd);
end
end