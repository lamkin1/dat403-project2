library(tidyverse)
install.packages("ggsci")
library(ggsci)
risk <- read_csv("/Users/nicholaspatrick/Downloads/application_train.csv")

risk |> count()

missing_values <- colSums(is.na(risk))
print(missing_values)

# To display only columns with missing values
missing_values[missing_values > 50000]

risk <- risk[, missing_values <= 60000]

risk <- risk |> filter(CODE_GENDER == 'M' | CODE_GENDER == 'F') |> drop_na() 

risk

risk |> 
ggplot(aes(x = TARGET, fill = as.factor(TARGET))) +
geom_bar() +
scale_fill_manual(values = c('blue4', 'red'))

write.csv(risk, "application_train_clean.csv")
