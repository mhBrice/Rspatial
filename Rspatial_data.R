#-------------------------------------------------------------------------------#
###  Packages and datasets used for Geospatial analyses and mapping with R   ####
#-------------------------------------------------------------------------------#

# Marie-Hélène Brice
# 01-05-2018


#-------------------------------------------------------------------------------#
###                             Install packages                             ####
#-------------------------------------------------------------------------------#

# Packages to install
pkgs <- c("sf",
          "lwgeom",
          "dplyr",
          "RColorBrewer",
          "raster",
          "mapview")

# Which packages you don't have
new.pkg <- pkgs[!(pkgs %in% installed.packages()[, "Package"])]

# Install
if (length(new.pkg)) 
  install.packages(new.pkg, dependencies = TRUE)



#-------------------------------------------------------------------------------#
###                      Set your working directory                          ####
#-------------------------------------------------------------------------------#

# setwd("/Users/my_name/Documents/path_to_where_your_QCBS_stuff")

# Create a new directory named "data" to download data
dir.create("data")



#-------------------------------------------------------------------------------#
### Localisation of sample points for water quality measurements in Montréal ####
#-------------------------------------------------------------------------------#

# Download csv file from web page in your working directory
download.file("http://donnees.ville.montreal.qc.ca/dataset/86843d31-4251-4002-b10d-620aaa751092/resource/adad6c48-fb48-40fc-a031-1ac870d978b4/download/scri03.-infor03.02-informatique03.02.07-donneesouvertesrsmaruissostationsstations_ruisso.csv",
                destfile = "data/ruisso.csv")



#-------------------------------------------------------------------------------#
###                 Water quality measurements in Montréal                   ####
#-------------------------------------------------------------------------------#

# Download csv file from web page in your working directory
download.file("http://donnees.ville.montreal.qc.ca/dataset/8c149ace-7b2f-4041-99ec-3bdbef5dcee6/resource/38c8eb26-46a1-4fc2-87a0-5c88e94cee8e/download/donnees_ruisso_2016.csv",
                destfile = "data/ruisso_data.csv")



#-------------------------------------------------------------------------------#
###                 MULTIPOLYGON of land use types in Montréal               ####
#-------------------------------------------------------------------------------#


# \!/ The following steps can take a few minutes to run \!/ #

# Download shapefiles
download.file("http://cmm.qc.ca/fileadmin/user_upload/geomatique/UtilisationDuSol/2016_Shapefiles/660-US-2016.zip", destfile = "data/landuse.zip")

# Unzip the main folder and name it "landuse"
unzip("landuse.zip", exdir="data/landuse")

# get all the zip files inside the main folder "landuse"
zipF <- list.files(path = "data/landuse/", pattern = "*.zip", full.names = TRUE)

# unzip all your files
plyr::ldply(.data = zipF, .fun = unzip, exdir = "data/landuse")

# Get the names of the land use shapefiles from the folder "landuse"
shp_files <- list.files(path = "data/landuse", pattern = ".shp")
shp_files <- sub(".shp", "", shp_files)

# Read all the shapefiles
LU <- list()
for(f in shp_files) {
  LU[[f]] <- st_read(dsn = "data/landuse/", layer = f)
}

# Combine all shapefiles together
LU_all <- do.call(rbind, LU)

# Write as a GeoPackage
st_write(LU_all, "data/LU_all.gpkg", driver = "GPKG")



#-------------------------------------------------------------------------------#
###     MULTILINESTRING of streams, ditches and watercourses in Montreal     ####
#-------------------------------------------------------------------------------#

# Download shapefile from web page in your working directory
download.file("http://donnees.ville.montreal.qc.ca/dataset/c128aff5-325c-4599-ab66-1c9d0b3abc94/resource/a37e11d4-f0a3-46a7-8636-76754fad72b3/download/courseau.zip", 
              destfile = "data/courseau.zip")

# Unzip the shapefile
unzip("data/courseau.zip", exdir = "data/courseau")



#-------------------------------------------------------------------------------#
###                   Raster of a canopy index of Montreal                   ####
#-------------------------------------------------------------------------------#

# Download tif file from web page in your working directory
download.file("http://cmm.qc.ca/fileadmin/user_upload/geomatique/IndiceCanopee/2015/660_Canopee2015_3m.zip",
              destfile = "data/canopee.zip")

# Unzip the main folder
unzip("data/canopee.zip", exdir = "data")

