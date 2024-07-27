    function ciphertxt= Encryption(plaintxt , key)
    plaintxt = upper(plaintxt);
    plaintxt = plaintxt(plaintxt ~=' ');
    key = upper(key);
    key = key(key ~=' ');
    char = 'A':'Z'
    ciphertxt =' ';
    fence = cell(5,5);
    index = 1;
    usedChar ='';
    for r=1:5
        for c=1:5
            while index <= length(key)
                character = key(index);
                if character =='J'
                    character = 'I';
                end
                
                if isempty(strfind(usedChar, character))
                    fence{r,c} = character;
                    usedChar =[usedChar,character];
                    index = index +1
                    break;
                    
                else
                    index = index + 1;
                end
            end
            
        end
    end
    ind =1
    for r=1:5
        for c=1:5
            while isempty(fence{r,c})
                character = char(ind);
                if character =='J'
                    character = 'I';
                end
                
                if isempty(strfind(usedChar, character))
                    fence{r,c} = character;
                    usedChar =[usedChar,character];
                    ind = ind +1
                    break;
                else
                    ind = ind+1;
                end
            end
            
        end
    end
    for i = 1:2:length(plaintxt)-1
        if plaintxt(i) == plaintxt(i+1)
            plaintxt = [plaintxt(1:i), 'X', plaintxt(i+1:end)];
        end
    end
    for i=1:2:length(plaintxt)
        ch1 = plaintxt(i); ch2=plaintxt(i+1);
        [r1,c1]= find(strcmp(fence, ch1));
        [r2,c2]= find(strcmp(fence,ch2))
        if r1 == r2
            % Same row: move right
            c1 = mod(c1, 5) + 1;
            c2 = mod(c2, 5) + 1;
        elseif c1 == c2
            % Same column: move down
            r1 = mod(r1, 5) + 1;
            r2 = mod(r2, 5) + 1;
        else
            % Rectangle swap
            temp = c1;
            c1 = c2;
            c2 = temp;
        end
        
        % Append encrypted characters to ciphertext
        ciphertxt = [ciphertxt, fence{r1, c1}, fence{r2, c2}];
    end
    
    % Display results
    disp('Matrix:');
    disp(fence);
    disp('Plaintext:');
    disp(plaintxt);
    disp('Ciphertext:');
    disp(ciphertxt);
    end