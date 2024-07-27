function ciphertxt = Encryption(plaintxt ,key)
plaintxt= upper(plaintxt);
plaintxt = plaintxt(plaintxt~=' ');
fence = cell(key ,length(plaintxt));
 row =1 ;
 col=1;
 for i=1 :length(plaintxt)
     fence{row ,col}= plaintxt(i);
     if row ==1 
         direction =1;
     elseif row == key
         direction=-1;
     end
     row = row+direction;
     col = col+1;
 end
 ciphertxt =[];
 for r=1:key
     for c=1 :length(plaintxt)
           if ~isempty(fence{r,c})
               ciphertxt = [ciphertxt,fence{r,c}]
           end
     end
 end
  disp(['cipher text is ',ciphertxt]);
end
