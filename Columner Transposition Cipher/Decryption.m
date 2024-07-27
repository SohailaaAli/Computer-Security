function plaintxt= Decryption(ciphertxt,key)
ciphertxt= upper(ciphertxt);
ciphertxt = ciphertxt(ciphertxt ~=' ');

key= upper(key);
key = key(key ~=' ');

row = ceil(length(ciphertxt)/length(key));
col = length(key);

if row*col > length(ciphertxt)
    for i=1 :row*col - length(ciphertxt)
        ciphertxt = strcat(ciphertxt ,'X');
    end
end

fence =cell(row ,col);
[~ , orderkey]= sort(key);
index =1;
for c=1:col 
     actualCol = orderkey(c);  
    for r=1:row
        fence{r ,actualCol}= ciphertxt(index);
        index = index+1;
    end
end


 plaintxt = '';
    for r = 1:row
        for c = 1:col
            plaintxt = [plaintxt, fence{r, c}];
        end
    end

end