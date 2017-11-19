function testall()
     digitlabels = 'test';
    for k = 10:-1:1
        digitL{k} = sprintf('%s%d',digitlabels,k);  
    end
    file=load('weight1.mat');
     S=load('C:\Users\Administrator\Downloads\mnist_all.mat');   
   
    digitL{1}=S.train0;
    digitL{2}=S.test1;
    digitL{3}=S.test2;
    digitL{4}=S.test3;
    digitL{5}=S.test4;
    digitL{6}=S.test5;
    digitL{7}=S.test6;
    digitL{8}=S.test7;
    digitL{9}=S.test8;
    digitL{10}=S.test9;
    count=0;
    for i = 1:1
        [ro col] = size(digitL{3});
        for j=1:ro
        for k=1:784
            inputt(1,k)=digitL{3}(j,k);
        end
        [output] = test(inputt,file.weightFL,file.weightSL,file.biasSL,file.biasFL);
        if output(1,1)==1
            count=count+1;
        save('weight','output');          
        end
        end
        ro
    end
    

   count
end