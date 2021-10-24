
HFA_data <- fread(file=here::here("report","your data"))

for  (i in seq_along(unique(HFA_data$hosp_id))){
  
  hospital_name = unique(HFA_data$hosp_id)[i]
  
  # if (unique(HFA_data$hosp_id)[i]=="AIC Health Centre - Lokichoggio") {
  #   hospital_name = "AIC Health Centre"
  # } else if (unique(HFA_data$hosp_id)[i] == "AIC Kalokol Health Centre") {
  #   hospital_name = "AIC Kalokol hospital"
  # } else{
  #   hospital_name = unique(HFA_data$hosp_id)[i]
  #   
  # }
  # 
  rmarkdown::render(
    input = here::here("report","unicef.hfa.report.Rmd"),
    output_format = "word_document",
    output_file = paste0("report_" ,i),
    output_dir = here::here("Docs"),
    params = list(hospital_name= hospital_name)
  )
  
  cat(unique(HFA_data$hosp_id)[i])
}

for  (j in seq_along(unique(HFA_data$hosp_id))){
  hospital_name = unique(HFA_data$hosp_id)[j]
  file.rename(paste0("Docs/","report_",j,".docx"),
            to=paste0("Docs/",hospital_name,".docx"))
  
}



  

paste0(HFA_data$hosp_id)
