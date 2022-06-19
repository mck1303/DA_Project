generated quantities {
    real mu=normal_rng(174,4);
    real sigma=lognormal_rng(4.4,0.04);    
    real prob = normal_rng(mu,sigma);
}