function plaintxt = Decryption(ciphertxt ,key)
ciphertxt = upper(ciphertxt);
key = upper(key);
ciphertxt = ciphertxt(ciphertxt ~=' ');
key = key (key~= ' ');
plaintxt='';
char= 'A':'Z';
fence = cell (26,26);
for r =1 :26
   for c =1 :26
       fence{r,c}= char(mod(r-1 + c-1, 26)+1);
   end
end
  disp(fence);
  
plaintxt ='';
keyLen = length(key);
for i=1 : length(ciphertxt)
    cipherChar =ciphertxt(i);
    keyChar = key(mod(i-1,keyLen)+1);
    keyPos = find(char == keyChar);
    for c=1 :26
        if fence{keyPos ,c} == cipherChar
            plainPos = c;
            break;
        end
    end
   plainChar = char(c);
   plaintxt =[plaintxt ,plainChar];
end
end

    
