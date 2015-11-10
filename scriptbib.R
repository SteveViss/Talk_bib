prod <- c(466419,497102,508795,515530,547617,540491,567204,580809,593568,594467,617762,632059,632781,649795,641388,698726)

year <- 1988:2003


jpeg(filename="~/Github/Talk_bib/images/nbarticles.jpg", unit="cm", width=16, height=14, res=300)
par(font=2, cex.lab=1.6, bty="l", mar=c(5,5,2,2))
plot(year,prod, col="grey30", cex=2.6, pch=20, ylab="Nombres d'articles", xlab="Années")
points(year,prod, col="grey30", cex=2.6, pch=3)
abline(lm(prod~year), lty=2)
text(1998,473402,label="Source: Wikipedia", pos=4, cex=1.1)
dev.off()
