generated quantities{
    real mu = poisson_rng(174);
    real sigma = poisson_rng(78);
    real prob = normal_rng(mu,sigma);
}