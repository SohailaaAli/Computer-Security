function ciphertxt = Encryption(plaintxt ,key)
plaintxt = upper(plaintxt);
plaintxt= plaintxt(plaintxt~= ' ');
key = upper(key);
key =key(key~=' ');

row=ceil(length(plaintxt)/length(key));
col = length(key);
fence =cell(row ,col);

if(row*col > length(plaintxt))
      for i=1 : (row*col - length(plaintxt))
          plaintxt=strcat(plaintxt,'X');
      end
  end


index=1
for r=1 :row
    for c=1 :col
        fence{r,c} = plaintxt(index);
        index= index+1;
    end
end

[~, keyOrder] = sort(key);  % Get the order of columns based on the key
    ciphertxt = [];
    for c = 1:col
        actualCol = keyOrder(c);  % Column to read from
        for r = 1:row
            ciphertxt = [ciphertxt, fence{r, actualCol}];
        end
    end
    
    % Display the ciphertext
    disp(['Ciphertext: ', ciphertxt]);
end