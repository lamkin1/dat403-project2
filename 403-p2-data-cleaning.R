library(tidyverse)
risk <- read_csv("/Users/nicholaspatrick/Downloads/application_train.csv")

risk |> count()

missing_values <- colSums(is.na(risk))
print(missing_values)

# To display only columns with missing values
missing_values[missing_values > 50000]

risk <- risk[, missing_values <= 60000]

risk <- risk |> filter(CODE_GENDER == 'M' | CODE_GENDER == 'F') |> drop_na() 

risk


write.csv(risk, "application_train_clean.csv")
