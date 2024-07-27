function ciphertxt = Encryption(plaintxt ,key)
plaintxt = upper(plaintxt);
key= upper(key);
plaintxt = plaintxt(plaintxt ~= ' ');
key = key(key ~= ' ');
fence = cell (26,26);
char = 'A':'Z';

for r=1 :26
    for c=1 : 26
        fence{r, c} = char(mod((r - 1 + c - 1), 26) + 1);
        
    end
end
disp(fence);
ciphertxt='';
keyLength= length(key);
for i=1 : length(plaintxt)
    plainChar = plaintxt(i);
    keyChar = key(mod(i - 1, keyLength) + 1); 
    plainPos = find(char == plainChar);
    keyPos = find(char == keyChar);
    cipherChar = fence{ keyPos,plainPos};
    ciphertxt = [ciphertxt, cipherChar];
    
end
end