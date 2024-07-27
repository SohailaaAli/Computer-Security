function plaintxt = Decryption(ciphertxt ,a,b)
ciphertxt = upper(ciphertxt);
ciphertxt = ciphertxt(ciphertxt ~= ' ');
char = 'A':'Z';
plaintxt='';
inv='';
for x = 1:26
    if mod(a * x, 26) == 1
        inv = x;
    end
end
for i=1 : length(ciphertxt)
    cipherInd = find(char ==ciphertxt(i))-1;
    plainInd = inv *(cipherInd -b) ;
    plainInd = mod(plainInd,26);
    plaintxt(i) = char(plainInd +1);
end
end