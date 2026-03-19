library(DBI)
library(RSQLite)

con <- dbConnect(RSQLite::SQLite(), "C:/Users/aasmi/Costal Carolina/initial results/trackman.db")

table_name <- dbListTables(con)[1]

last_1000 <- dbGetQuery(con, paste0("SELECT * FROM \"", table_name, "\" ORDER BY rowid DESC LIMIT 1000"))

dbDisconnect(con)

write.csv(last_1000, "C:/Users/aasmi/Costal Carolina/340 project/last_1000_pitches.csv", row.names = FALSE)
