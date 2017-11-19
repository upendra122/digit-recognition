function [a,b,c,d] = train(input,weightFL,weightSL,biasFL,biasSL,oresult,costFL,costSL,biasCFL,biasCSL)
    temp = weightFL * input;
    tempWb = temp+biasFL;
    for i=1:100
    tempFLO(i,1) = sigmoid(tempWb(i,1));
    end
    temp2 = weightSL * tempFLO;
    temp2Wb = temp2 + biasSL;
    for i=1:10
        tempSLO(i,1) = sigmoid(temp2Wb(i,1));
    end
    tempxt=tempSLO-oresult;
    temp2P = zeros(10,1) ;
    for i=1:10
        temp2P(i,1) = sigmoid_prime(temp2Wb(i,1));
    end
    temp2P = temp2P .* tempxt;
    biasCSL =biasCSL + temp2P;
    costSL = costSL + temp2P * tempFLO';
    tempup = weightSL' * temp2P;
    tempP = zeros(100,1);
    for i=1:100
        tempP(i,1) = sigmoid_prime(tempWb(i,1));
    end
    tempup = tempup .* tempP;
    biasCFL =biasCFL + tempup;
    t= double(tempup) * double(input');
    costFL = costFL + t; 
    a=biasCFL;
    b=biasCSL;
    c=costFL;
    d=costSL;
    
end
    
        