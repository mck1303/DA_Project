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
    vector[N] log_lik;
    array[N] real prob;
    for (j in 1:N){
        log_lik[j] = normal_lpdf(probs[j]|mu,sigma);
        prob[j] = normal_rng(mu,sigma);
    }
}