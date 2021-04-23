library("neuralnet")

#Tabla 1
#Características
ojos_grandes <-  as.data.frame(c(1,1,0))
dientes_grandes <-  as.data.frame(c(1,0,0))
cara_peluda <-  as.data.frame(c(1,0,1))
arrugado_a <-  as.data.frame(c(0,1,0))
guapo_a <- as.data.frame(c(0,0,1))
dulce_y_amable <- as.data.frame(c(0,1,1))

#Tabla 2
#Acciones
grita <- as.data.frame(c(1,0,0))
huye <- as.data.frame(c(1,0,0))
busca_lenador <- as.data.frame(c(1,0,0))
besa_en_la_mejilla <-  as.data.frame(c(0,1,1))
ofrece_alimento  <-  as.data.frame(c(0,1,0))
coquetea <-  as.data.frame(c(0,0,1))
se_acerca <-  as.data.frame(c(0,1,1))


trainingdata <- cbind(ojos_grandes,dientes_grandes,cara_peluda,arrugado_a,guapo_a,dulce_y_amable,grita,huye,busca_lenador,besa_en_la_mejilla,ofrece_alimento,coquetea,se_acerca)
print(trainingdata)
colnames(trainingdata) <- c("ojos_grandes","dientes_grandes","cara_peluda","arrugado_a","guapo_a","dulce_y_amable","grita","huye","busca_lenador","besa_en_la_mejilla","ofrece_alimento","coquetea","se_acerca")

#Entrenamiento
capas_ocultas = 12
umbral = 0.01
model <- neuralnet(grita+huye+busca_lenador+besa_en_la_mejilla+ofrece_alimento+coquetea+se_acerca~ojos_grandes+dientes_grandes+cara_peluda+arrugado_a+guapo_a+dulce_y_amable,trainingdata, hidden=capas_ocultas, threshold=umbral)

print(model)

plot(model)

final_output=cbind (ojos_grandes,dientes_grandes,cara_peluda,arrugado_a,guapo_a,dulce_y_amable,grita,huye,busca_lenador,besa_en_la_mejilla,ofrece_alimento,coquetea,se_acerca, as.data.frame(model$net.result) )
colnames(final_output) = c("ojos_grandes","dientes_grandes","cara_peluda","arrugado_a","guapo_a","dulce_y_amable","grita","huye","busca_lenador","besa_en_la_mejilla","ofrece_alimento","coquetea","se_acerca","Ngrita","Nhuye","Nbusca_lenador","Nbesa_en_la_mejilla","Nofrece_alimento","Ncoquetea","Nse_acerca")
print(final_output)

#Tabla nueva
#Características ligeramente diferentes
ojos_grandes <-  as.data.frame(c(1,0,0))
dientes_grandes <-  as.data.frame(c(1,0,0))
cara_peluda <-  as.data.frame(c(1,0,1))
arrugado_a <-  as.data.frame(c(1,1,0))
guapo_a <- as.data.frame(c(0,1,1))
dulce_y_amable <- as.data.frame(c(0,1,1))

newdata <- cbind(ojos_grandes,dientes_grandes,cara_peluda,arrugado_a,guapo_a,dulce_y_amable)
colnames(newdata) <- c("ojos_grandes","dientes_grandes","cara_peluda","arrugado_a","guapo_a","dulce_y_amable")


predict(model, newdata, rep = 1, all.units = TRUE)
