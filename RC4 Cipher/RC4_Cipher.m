function ciphertxt = RC4_Cipher(plaintxt,key)
S = 0:7;
keyLength = length(key);

T = zeros(1, 8);

for i = 0:7
T(i+1) = key(mod(i , keyLength)+1);
end

j = 0;
for i = 0:7
j = mod(j + S(i+1) + T(i+1), 8);
temp = S(i+1);
S(i+1) = S(j+1);
S(j+1) = temp;
end

encrypted =
uint8(zeros(size(plaintxt)));
i = 0; j = 0;
for k = 1:length(plaintxt)
i = mod(i+1 , 8);
j = mod(j + S(i+1), 8);
temp = S(i+1);
S(i+1 ) = S(j+1);
S(j+1 ) = temp;

t = mod(S(i+1) + S(j+1), 8);

K = S(t+1);
encrypted(k) =
bitxor(uint8(plaintxt(k)), K);
end

ciphertxt = encrypted;
end

RC4 for text Messages :

function ciphertxt = RC4__Cipher(plaintext,
key)
if ischar(key)
key = uint8(key);
end
if ischar(plaintext)
plaintext = uint8(plaintext);
end
S = 0:255;
keyLength = length(key);
% Key-Scheduling Algorithm (KSA)
T = zeros(1, 256);
for i = 1:256
T(i) = key(mod(i - 1, keyLength) +
1); % Fill T with key in a cyclic pattern
end
j = 0;
for i = 1:256
j = mod(j + S(i) + T(i), 256);
temp = S(i);
S(i) = S(j);
S(j) = temp;
end
% PRGA: Generate keystream
encrypted =
uint8(zeros(size(plaintext)));

i = 0; j = 0;
for k = 1:length(plaintext)
i = mod(i + 1, 256);
j = mod(j + S(i), 256);
temp = S(i);
S(i) = S(j);
S(j) = temp;
% Calculate keystream index
t = mod(S(i) + S(j), 256);
% XOR with keystream byte
K = S(t);
encrypted(k) = bitxor(plaintext(k),
K);
end
ciphertxt = encrypted;
end
%%%%%%%%%%her test Case of encryption and decryption %%%%%%%
% Test the RC4 function
% key = 'SecretKey';
% plaintext = 'Hello, MATLAB!';
% Convert key and plaintext to uint8
% key_uint8 = uint8(key);
% plaintext_uint8 = uint8(plaintext);
% Encrypt the plaintext
% ciphertext = RC4_Cipher(plaintext_uint8,
key_uint8); % Ensure correct inputs

%
% disp('Cipher Text:');
% disp(ciphertext);
% decrypted_text =
char(RC4_Cipher(ciphertext, key_uint8)); %
Convert to char
%
% disp('Decrypted Text:');
% disp(decrypted_text); % Expected output:
'Hello, MATLAB!'