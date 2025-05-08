library(tidyverse)                # Tidyverse used here but dplyr is sufficient
source("ReadC3D.R")               # Main script and function
source("ReadC3DParameters.R")     # Parameter reading subfunctions

# Specify any C3D file path/name
C3DFileName <- 'Sample Data/Vicon pyCGM2 lower limb CGM24 Walking01.c3d'

# Call the function, here using all default options
C3D <- ReadC3D(C3DFileName = C3DFileName)

# Peek at parameters
P <- C3D$Parameters

# Save the C3D list0 as an RDS file
# This is how I typically use ReadC#d, just as a file conversion tool
saveRDS(C3D, file = paste0(C3DFileName, '.RDS'))

# I won't go over all options, but I prefer the wide format
# Schwartz prefers the long format, thas is why it is the default
C3D <- ReadC3D(C3DFileName = C3DFileName, MarkerDataFormat = 'wide')

# Write RDS
saveRDS(C3D, file = paste0(C3DFileName, '_wide.RDS'))
