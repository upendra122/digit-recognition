function [a] = test(input,weightFL,weightSL,biasSL,biasFL)    
    temp = weightFL * double(input)';
    tempWb = temp+biasFL;
    for i=1:100
        tempFLO(i,1) = sigmoid(tempWb(i,1)) ;      
    end
    temp2 = weightSL * tempFLO;
    temp2Wb = temp2 + biasSL;
    for i=1:10
        tempSLO(i,1) = sigmoid(temp2Wb(i,1));
    end
    tempSLO'
     for i=1:10
        if tempSLO(i,1) < .5 
            tempSLO(i,1)=0;
        else
            tempSLO(i,1)=1;
        end
     end
   a=tempSLO;
end
