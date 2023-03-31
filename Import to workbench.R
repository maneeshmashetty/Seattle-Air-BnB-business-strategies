library(RMySQL)
library(readxl)
library(openxlsx)

getwd()



#use this closeresultset in error mention about result set
dbClearResult(dbListResults(con)[[1]])

# to establish connection between R & MySQL
con <- dbConnect(MySQL(), user='root', password='MySQL', dbname='airbnb');

# List the tables available in this database to ensure connection is established.
dbListTables(con)

# to enable local file upload to MySQL
dbSendQuery(con,"SET GLOBAL local_infile=1;")
dbSendQuery(con,"SHOW GLOBAL VARIABLES LIKE 'local_infile';")

# read data from host.xlsx and write to hosts table of MySQL
host_url_r <- read_excel("host_url.xlsx")
dbClearResult(dbListResults(con)[[1]])
dbWriteTable(con, "host_url", host_url_r, append = TRUE, row.names = FALSE)

# read data from host.xlsx and write to hosts table of MySQL
host_r <- read_excel("hosts.xlsx")
dbWriteTable(con, "host", host_r, append = TRUE, row.names = FALSE)

# read data from listing_main_table.xlsx and write to listing table of MySQL
listing_r <- read_excel("listing.xlsx")

dbWriteTable(con, "listing", listing_r, append = TRUE, row.names = FALSE)


# to deal with limitation of xlsx of 1048547 rows only
cd <- read.csv("calendar.csv")
cd$price <- as.numeric(gsub("\\$", "", cd$price))
colnames(cd) <- c("Listing_ID", "Date", "Available", "Price")
write.xlsx(cd, file = "calendar_revised.xlsx")
calendar_revised <- read_excel("calendar_revised.xlsx")
dbWriteTable(con, "calender", cd, append = TRUE, row.names = FALSE)

# read data from Amenties_Final_R.xlsx and write to property_amenities table of MySQL
amenties_r <- read_excel("amenities.xlsx")
dbWriteTable(con, "amenities", amenties_r, append = TRUE, row.names = FALSE)

# read data from Host_Ver_Final_R.xlsx and write to host_verification_types table of MySQL
Host_ver_r <- read_excel("host_verification.xlsx")
dbWriteTable(con, "host_verification", Host_ver_r, append = TRUE, row.names = FALSE)

#To DO
# Adding values to countries table
dbSendQuery(con, "INSERT INTO `airbnb`.`countries` (`country_code`, `country_name`) VALUES ('US', 'United States');")

# read data from Listing Address.xlsx and write to listing_address table of MySQL
Listing_Add_r <- read_excel("listing_addresses.xlsx")
dbWriteTable(con, "listing_addresses", Listing_Add_r, append = TRUE, row.names = FALSE)

# read data from Listing_Urls.xlsx and write to listing_urls table of MySQL
Listing_Urls_r <- read_excel("listing_url.xlsx")
dbWriteTable(con, "listing_url", Listing_Urls_r, append = TRUE, row.names = FALSE)

# read data from Prices.xlsx and write to prices table of MySQL
Prices_r <- read_excel("price.xlsx")
dbWriteTable(con, "price", Prices_r, append = TRUE, row.names = FALSE)

# read data from Property_Details.xlsx and write to property_details table of MySQL
Property_Det_r <- read_excel("property_details.xlsx")
dbWriteTable(con, "property_details", Property_Det_r, append = TRUE, row.names = FALSE)

# read data from Reviewers.xlsx and write to reviewers table of MySQL
Reviewers_r <- read_excel("reviewers.xlsx")
dbWriteTable(con, "reviewers", Reviewers_r, append = TRUE, row.names = FALSE)

# read data from Reviews.xlsx and write to reviewers table of MySQL
Reviews_r <- read_excel("reviews.xlsx")
dbWriteTable(con, "reviews", Reviews_r, append = TRUE, row.names = FALSE)

Reviews_sr <- read_excel("review_scores.xlsx")
dbWriteTable(con, "review_scores", Reviews_sr, append = TRUE, row.names = FALSE)


