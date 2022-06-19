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
    sigma ~ lognormal(4.4,0.04);    
    probs ~ normal(mu,sigma);

}

generated quantities {
    real log_lik;
    real prob;
    log_lik = normal_lpdf(probs|mu,sigma);
    prob = normal_rng(mu,sigma);
 
}