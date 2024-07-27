function ciphertxt = doubleT(plaintxt , rowVector,colVector)
plaintxt = lower(plaintxt);
plaintxt = plaintxt(plaintxt~=' ');

row = length(rowVector);
col = length(colVector);
fence = cell(row ,col);
index=1;
for r = 1:row
    for c = 1:col
        if index <= length(plaintxt)
            fence{r, c} = plaintxt(index);
        else
            fence{r, c} = 'X';
        end
        index = index+1;
    end
end
Mat1 = cell(row, col);
for i=1: row
    Mat1(i,:)= fence(rowVector(i),:);
end
Mat2 = cell(row, col);
for j=1: col
    Mat2(:,j)= Mat1(:,colVector(j));
end
ciphertxt = '';
for r = 1:row
    for c = 1:col
        ciphertxt = [ciphertxt, Mat2{r, c}];
    end
end
end