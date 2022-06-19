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
    vector[N] log_lik;
    vector[N] prob;
    
    for (i in 1:N){
        prob[i] = normal_rng(mu,sigma);
        log_lik[i] = normal_lpdf(probs[i]|mu,sigma);
        
    }
}