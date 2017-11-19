function [a,b,c,d ] = backpropagation(weightFL,weightSL,biasFL,biasSL,costFL,costSL,biasCFL,biasCSL,lrate)

    weightFL = weightFL - lrate .* costFL;
    weightSL = weightSL - lrate .* costSL;
    biasFL = biasFL - lrate .* biasCFL;
    biasSL = biasSL - lrate .* biasCSL;
    a=weightFL;
    b=weightSL;
    c=biasFL;
    d=biasSL;

end
        
        