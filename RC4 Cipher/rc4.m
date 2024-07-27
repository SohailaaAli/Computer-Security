function ciphertxt = rc4(plaintxt ,key)
if ischar(plaintxt)
    plaintxt = uint8(plaintxt);
    
end

if ischar(key)
    key = uint8(key);
end

s = 0: 255;
t= zeros(1,256);

for i=0 : 255
    t(i+1) = key(mod(i ,length(key))+1);
end
disp(t);

j=0;
for i=0 :255
    j= mod(j+s(i+1)+ t(i+1), 256);
    temp = s(i+1);
    s(i+1) = s(j+1);
    s(j+1) = temp;
end

cipherMat = uint8(zeros(size(plaintxt)));

i=0;
j=0;
for k=1 : length(plaintxt)
    i= mod(i+1 ,256);
    j= mod(j + s(i+1) ,256);
    temp = s(i+1);
    s(i+1) = s(j+1);
    s(j+1) = temp;
    h = mod(s(i+1) + s(j+1) ,256);
    e = s(h+1);
    cipherMat(k) = bitxor(uint8(plaintxt(k)),e)
end
ciphertxt = cipherMat;
end