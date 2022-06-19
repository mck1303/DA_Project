generated quantities{
    real mu=normal_rng(174,4);
    real sigma=lognormal_rng(4.4,0.04);
    real nu=lognormal_rng(2.7,0.1);
    real prob = student_t_rng(nu,mu,sigma);
}