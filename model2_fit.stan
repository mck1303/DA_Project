data{
    int N;
    real probs[N];
}

parameters{
    real mu;
    real nu;
    real<lower=0> sigma;
}


model{
    mu ~ normal(174,4);
    sigma ~ lognormal(4.4,0.04);
    nu ~ lognormal(2.7,0.1);
    probs ~ student_t(nu,mu,sigma);

}

generated quantities {
    vector[N] log_lik;
    vector[N] prob;
    
    for (i in 1:N){
        log_lik[i] = student_t_lpdf(probs[i]|nu,mu,sigma);
        prob[i] = student_t_rng(nu,mu,sigma);
    }
    

}