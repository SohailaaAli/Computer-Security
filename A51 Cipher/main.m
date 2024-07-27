key = [ 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 ];
plain = [ 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 ];
key_stream = keygen(key);
cipher = encrypt_decrypt(plain , key_stream);
disp(cipher);
plainAgain = encrypt_decrypt(cipher , key_stream);
disp('plaintxt');
disp(plainAgain);
