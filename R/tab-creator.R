
sp = paneles$Especie[2]




for(i in seq_along(paneles$Especie)){
  sp <- paneles$Especie[i]
  pos <- which(sort(paneles$Especie)==sp)
  fam <- paneles$Familia[i]



sink(paste0("paneles/",gsub(" ", "_", sp),".qmd"))
cat(paste0(
"---
title: ",sp,"\n",
"sortby: ", pos,"\n",
"subtitle: ",fam,"\n",
"toc: false
about:
  id: profile
  template: marquee

---

:::{#profile}
:::


![",sp,"](paneles/",sp,".jpg){width=95%}

<iframe width=\"100%\" height=\"600\" src=\"fichas/paneles_",sp,"_",toupper(fam),".pdf\"></iframe>"))
sink()
# file.show(paste0("paneles/",gsub(" ", "_", sp),".qmd"))
}
