function p = sigmoid_prime(z)
    p=sigmoid(z)*(1-sigmoid(z));
end