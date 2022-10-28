#power and sample size code:
# modified: 11/2/21
require(pwr)

#change parameters:
pA=0.28 #prop treatment
pB=0.12 #prop placebo
kappa=1 #enrollment ratio
alpha=0.025 #type 1 error 
beta=0.20 #desired power level

(nB=(pA*(1-pA)/kappa+pB*(1-pB))*((qnorm(1-alpha)+qnorm(1-beta))/(pA-pB))^2)
ceiling(nB) #round up the sample size
z=(pA-pB)/sqrt(pA*(1-pA)/nB/kappa+pB*(1-pB)/nB)
(Power=pnorm(abs(z)-qnorm(1-alpha)))
## Note:The example from Chow p.89 is obtained
## by using alpha=0.025

#alternately, using the pre-spec function:
p.out <- pwr.2p.test(h = ES.h(p1 = 0.28, p2 = 0.12),
            sig.level = 0.025,
            power = 0.80,
            alternative = "greater")

#and plotting goes here:
# store power out as obj:
p.out <- pwr.2p.test(h = ES.h(p1 = 0.55, p2 = 0.15),
                     sig.level = 0.025,
                     power = 0.80,
                     alternative = "greater")

plot(p.out, main = "Sample Size Calculation (AMDC = 28%; Placebo = 12%)")

