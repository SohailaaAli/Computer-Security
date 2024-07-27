function ciphertxt = Encryption(plaintxt,a,b)
plaintxt = upper(plaintxt);
plaintxt = plaintxt(plaintxt ~= ' ');
char ='A':'Z';
for i=1 : length(plaintxt)
    plainInd= find(char == plaintxt(i))-1;
    cipherInd =a * plainInd + b;
    cipherInd = mod(cipherInd , 26);
    ciphertxt(i)= char(cipherInd+1);
end
end