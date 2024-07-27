function ciphertxt = Encryption(plaintxt ,key)
plaintxt = lower(plaintxt);
plaintxt = plaintxt(plaintxt ~=' ');
ciphertxt = ''; 
char = 'a':'z';
for i=1 :length(plaintxt)
   plainInd = find(char == plaintxt(i));
   cipherInd = plainInd +key;
   cipherInd = mod(cipherInd-1 ,26)+1;
   ciphertxt(i) = char(cipherInd)
end
ciphertxt = upper(ciphertxt);
end