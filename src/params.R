library(tidyverse)
nsc20.1 <- read.csv(file = "../NSC 2020/output/nsc20.1.csv")


school <- unique(nsc20.1$school)
school <- str_replace_all(school, "[&,/]", " ")
school <- str_squish(school)

for(school in school){
  print(school)
  rmarkdown::render("src/nsc_2020.Rmd",
                    output_file = stringr::str_c("output/", school, ".pdf"),
                    params = list(school = school))
}