function plaintxt = Decryption(ciphertxt,key)
ciphertxt = upper(ciphertxt);
ciphertxt = ciphertxt(ciphertxt~=' ');
plaintxt=' ';
char ='A':'Z';
for i=1 :length(ciphertxt)
    cipherInd = find(char == ciphertxt(i));
    plainInd = cipherInd -key;
    plainInd = mod(plainInd-1,26)+1;
    plaintxt(i)= char(plainInd);
    
end
plaintxt = lower(plaintxt);

end