function [v, t, lt, keyind] = cnn(wordvector, wc)%from input layer to converlutionla layer%mm is the operation dimention of cnn  and od is the dimention of output featrue%fw is the fix windows%wc is weigth matrix and need train%v is output vector after extracting feature% t is the index who win the max operation% lt is the concate vactor[m,n] = size(wordvector);[mm, ~] = size(wc);lt = zeros(m-2,n*3);ht = zeros(m-2,mm);pj = zeros(1, 3*n);keyind = zeros(1, mm);%get lt and ht%wordvectorfor i=1:m-2    %disp('iter i:')    %i    for j=1:3        pj((j-1) * n+1 : j*n) = wordvector(i+j-1, :);    end    lt(i, :) = pj;    ht(i, :) = tanh(pj * wc');endif m-2 == 1    %z =zeros(1, mm);    v = ht;    %ht = [ht;z];    t = ones(1, n);else    [v, t] = max(ht);end% judg keywordfor j=1:mm    k = jugmax(ht(1:m-2, j));    if  k ~= -1        keyind(j) = k;    endend