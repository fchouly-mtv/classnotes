#rnorm(10,10,1)

# Echantillon

ech<-c(12.03 , 9.14 , 10.70 , 9.61 , 8.96 , 11.98 , 10.08 , 9.47 , 9.61 , 10.24 )

# Moyenne et variance corrigee

mech<-mean(ech)
vech<-var(ech)

# Intervalle de confiance de niveau 0.05

imin<-mech-2.26*vech/sqrt(10)
imax<-mech+2.26*vech/sqrt(10)

# Intervalle de confiance de niveau 0.01

imin2<-mech-3.25*vech/sqrt(10)
imax2<-mech+3.25*vech/sqrt(10)


