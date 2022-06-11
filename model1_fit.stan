data{
    int N;
    real probs[N];
}

parameters{
    real mu;
    real<lower=0> sigma;

}

model{
    mu ~ normal(174,4);
    sigma ~ normal(78,4);    
    probs ~ normal(mu,sigma);

}

generated quantities {
    real prob = normal_rng(mu,sigma);
}