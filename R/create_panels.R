
library(readxl)
library(labeleR)
library(openxlsx)
library(tidyr)

source("R/paneles_functions.R")
paneles <- read_excel("R/paneles_info.xlsx", sheet=3)
 pruebafecha <- read_excel("R/paneles_info.xlsx", sheet=3, col_types = c("date"))
colnames(paneles)
paneles$Fecha_recoleccion <- pruebafecha$Fecha_recoleccion

notneed <- c ("Composición de Salix","Composición Quercus perennifolios","Composición Quercus marcescentes", "Composición Quercus caducifolios","Composición Hojas y sámaras de Acer", "Composición Cálices Genisteas?? (Ilustración)",  "Panel comparativo de pinnas", "Equisetum sp. (con dimorfismo de pies)")
paneles <- subset(paneles, !Especie %in% notneed)

paneles <- paneles %>% drop_na(`Uso arriba`)

paneles$Especie[paneles$Especie=="Quercus ilex subsp. ballota (Q. rotundifolia)"] <- "Quercus rotundifolia"
paneles$Especie[paneles$Especie=="Quercus ilex subsp. ilex"] <- "Quercus ilex"
paneles$Especie[paneles$Especie=="Quercus ilex subsp. ballota (Q. rotundifolia)"] <- "Quercus rotundifolia"

paneles$qr <- paste0("https://herbariodocenteuam.github.io/Paneles/paneles/",gsub(" ", "_", paneles$Especie),".html")
tempfile()

create_panel(
  data = paneles[1:2,],
  path = "labeleR_output",
  filename = "paneles",
  qr = "qr",
  title ="Herbario Docente MA-UAM" ,
  subtitle = "Paneles de flora - Unidad de Botánica - Departamento de Biología UAM",
  family.column = "Familia",
  taxon.column = "Especie",
  author.column = "Autor",
  vernaculo.column = "Nombres_vernaculos",
  sinonimo.column = "Sinonimos_sep_coma",
  descripcion.column = "Redaccion",
  edafico.column = "Preferencia_edafica",
  piso.column = "Piso_bioclimatico",
  biotipo.column = "Biotipo",
  raunkier.column = "Biotipo_raunkier",
  altitud.column = "Altitud",
  usos.column = "Usos",
  reproduccion.column = "Sistema_reproductivo",
  hoja.column = "Tipo_hoja",
  filotaxis.column = "Filotaxis",
  # localidad.column = "Localidad",
  habito.column = "Habito",
  lpic="R/marcaUAM_AhorizontalNegro.png",
  rpic="R/bot_logo_2023.png",
  # fecha.column = "Fecha_recoleccion",
  template="R/paneles.Rmd"
)




