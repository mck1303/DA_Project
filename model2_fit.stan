data{
    int N;
    real probs[N];
    int mu;
    int sigma;
}

model{
    mu ~ poisson(178);
    sigma ~ poisson(74);
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