function res = encrypt_decrypt (txt , key_stream)
res = zeros(1,length(txt));
    for i = 1:length(txt)
        res(i) = bitxor(txt(i),key_stream(i));
    end
end


