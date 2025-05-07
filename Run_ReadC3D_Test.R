
library(tidyverse)

C3DFileNames <- list.files(
  'Sample Data', 
  pattern = "\\.c3d$", 
  full.names = TRUE, 
  ignore.case = TRUE, 
  recursive = TRUE)

C3DFileNames 

out_files <- sub("\\.c3d$", "", basename(C3DFileNames), ignore.case = TRUE)

out_paths <- dirname(C3DFileNames)

# Render all C3Ds in directory ...

for (file in 1:length(C3DFileNames)) {
  cat(C3DFileNames[file], '\n')
  
  rmarkdown::render(
    input = 'ReadC3D_Test.qmd',
    params = list(FileName = C3DFileNames[file]),
    output_file = out_files[file],
    output_dir = out_paths[file])
}


# Render one at time ...

# Function to render one at time
RenderFile <- function(C3DFileName) {
  out_file <- sub("\\.c3d$", "", basename(C3DFileName), ignore.case = TRUE)
  out_path <- dirname(C3DFileName)
  
  rmarkdown::render(
    #input = "FU_Gait_Plots.Rmd",
    input = 'ReadC3D_Test.qmd',
    params = list(FileName = C3DFileName),
    output_file =out_file,
    output_dir = out_path)
}

RenderFile(C3DFileName)
