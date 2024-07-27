function ciphertxt = oneTimePad(plaintxt,key)

if length(plaintxt)~= length(key)
    dis('Length plaintxt and key must be same');
end
for i=1: length(plaintxt)
    plainDec= double(plaintxt(i));
    keyDec = double(key(i));
    cipherDec =bitxor(plainDec ,keyDec);
    ciphertxt(i)= char(cipherDec);
end

end