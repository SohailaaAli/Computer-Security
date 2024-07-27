function plaintxt = Decryption(ciphertxt ,key)
ciphertxt = upper(ciphertxt);
ciphertxt = ciphertxt(ciphertxt~=' ');
fence= cell(key , length(ciphertxt));

row =1;
col =1;
 for i=1 :length(ciphertxt)
     fence{row,col}='_';
     if row == 1
         direction = 1;
     elseif row== key
         direction =-1;
     end
     row = row +direction ;
     col = col+1;
 end
index =1
 for r= 1: key
     for c =1:length(ciphertxt)
         if ~isempty(fence{r,c})
             fence{r,c}= ciphertxt(index);
             index =index+1;
         end
     end
 end
 
 plaintxt =[];
 r=1;
 c=1;
for i=1 :length(ciphertxt)
     plaintxt= [plaintxt , fence{r,c}]
     if r ==1 
         direction =1;
     elseif r == key
         direction=-1;
     end
     r = r+direction;
     c = c+1;
 end
  disp(['plain text is ',plaintxt]);
end



