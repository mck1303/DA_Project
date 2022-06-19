data{
    int N;
    real probs[N];
}

parameters{
    real mu;
    real nu;
    real sigma;
}


model{
    mu ~ normal(174,4);
    sigma ~ lognormal(4.4,0.04);
    nu ~ lognormal(2.7,0.1);
    probs ~ student_t(nu,mu,sigma);

}

generated quantities {
    real log_lik;
    real prob;
    prob = normal_rng(mu,sigma);
    
    log_lik = student_t_lpdf(probs|nu,mu,sigma);
    

}