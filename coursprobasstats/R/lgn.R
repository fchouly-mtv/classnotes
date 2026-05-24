# Simple illustration de la loi des grands nombres
#
# On génère des échantillons de taille de plus en plus
# grande de variables suivant la loi de Bernoulli B(1/2)
#
# On fait la moyenne empirique de chaque échantillon, et on
# affiche cette moyenne en fonction de la taille

tailleb <- 20
nbechb  <- 50
mbernoulli <- array(0,c(nbechb,tailleb))

for (i in (1:tailleb)) {
	for (j in (1:nbechb)) {
		echbernoulli <- rbinom(2^(i-1),1,0.5)
		mbernoulli[j,i] <- mean(echbernoulli)
	}
}

pdf("lgn1.pdf")
plot(seq(0,tailleb-1),mbernoulli[1,],xlab="log2(n)",ylab="moyennes empiriques")
dev.off()

pdf("lgn2.pdf")
plot(seq(0,tailleb-1),mbernoulli[1,],xlab="log2(n)",ylab="moyennes empiriques")
for (j in (2:2)) {
	points(seq(0,tailleb-1),mbernoulli[j,],col=j)
}
dev.off()

pdf("lgn10.pdf")
plot(seq(0,tailleb-1),mbernoulli[1,],xlab="log2(n)",ylab="moyennes empiriques")
for (j in (2:10)) {
	points(seq(0,tailleb-1),mbernoulli[j,],col=j)
}
dev.off()

pdf("lgn50.pdf")
plot(seq(0,tailleb-1),mbernoulli[1,],xlab="log2(n)",ylab="moyennes empiriques")
for (j in (2:50)) {
	points(seq(0,tailleb-1),mbernoulli[j,],col=j)
}
dev.off()


