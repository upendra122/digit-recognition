function neuralNetwork(inputN,hiddenN,outputN)
    weightFL = rand(hiddenN,inputN);
    weightFL = weightFL .* .1;
    biasFL=ones(hiddenN,1);
    weightSL= rand(outputN,hiddenN);
    weightSL= weightSL .* .1;
    biasSL=ones(outputN,1);
    S=load('C:\Users\Administrator\Downloads\mnist_all.mat');   
    digitlabels = 'train';
    for k = 10:-1:1
        digitL{k} = sprintf('%s%d',digitlabels,k);  
    end
    digitL{1}=S.train0;
    digitL{2}=S.train1;
    digitL{3}=S.train2;
    digitL{4}=S.train3;
    digitL{5}=S.train4;
    digitL{6}=S.train5;
    digitL{7}=S.train6;
    digitL{8}=S.train7;
    digitL{9}=S.train8;
    digitL{10}=S.train9;
    for iteration=1:20
    costFL = zeros(hiddenN,inputN);
    costSL = zeros(outputN,hiddenN);
    biasCSL = zeros(outputN,1);
    biasCFL = zeros(hiddenN,1);
    for i=1:2
        [ro col] = size(digitL{i});
        input = rand(784,1);
        for j=1:ro
            for k=1:784
            input(k,1)=digitL{i}(j,k) * .001;
            end
            oresult= zeros(10,1);
            oresult(i,1)=1;
            [biasCFL,biasCSL,costFL,costSL]= train(input,weightFL,weightSL,biasFL,biasSL,oresult,costFL,costSL,biasCFL,biasCSL);   
            
        end  
      
    end
    save('cost','biasCFL','biasCSL','costFL','costSL');
    costFL = costFL/(hiddenN*inputN);
    costSL = costSL/(outputN*hiddenN);
    biasCFL= biasCFL/100;
    biasCSL=biasCSL/10;
     lrate = .101;
    [weightFL,weightSL,biasFL,biasSL] = backpropagation(weightFL,weightSL,biasFL,biasSL,costFL,costSL,biasCFL,biasCSL,lrate);
     iteration
    end
    save('weight1','weightFL','weightSL','biasFL','biasSL');
    digitlabels = 'test';
    for k = 10:-1:1
        digitL{k} = sprintf('%s%d',digitlabels,k);  
    end
    digitL{1}=S.test0;
    digitL{2}=S.test1;
    digitL{3}=S.test2;
    digitL{4}=S.test3;
    digitL{5}=S.test4;
    digitL{6}=S.test5;
    digitL{7}=S.test6;
    digitL{8}=S.test7;
    digitL{9}=S.test8;
    digitL{10}=S.test9;
    for i = 1:2
        [ro col] = size(digitL{i});
        for j=1:1
        for k=1:784
            inputt(1,k)=digitL{i}(j,k) * .001;
        end
        [output] = test(inputt,weightFL,weightSL,biasSL,biasFL);
        save('weight','output');          
       end
    end
end