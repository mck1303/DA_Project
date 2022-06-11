data{
    int N;
    real probs[N];
}

parameters{
    real mu;
    real<lower=0> sigma;

}

model{
    mu ~ poisson();
    sigma ~ poisson();
    probs ~ normal(mu,sigma);

}

generated quantities {
    real prob = normal_rng(mu,sigma);
}