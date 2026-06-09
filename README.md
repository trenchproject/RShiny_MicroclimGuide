# RShiny_MicroclimGuide
RShiny_Microclim is an [interactive shiny app](https://trenchproject.shinyapps.io/RShiny_MicroclimGuide/) that facilitates the selection of microclimate datasets.
The app compares 8 different datasets (SCAN, ERA5-Land, GLDAS, gridMET, NOAA NCDC, microclim, microclimUS, USCRN) both temporally and spatially.
Once users selects a dataset, we offer [this](https://bookdown.org/huckley/microclimate_users_guide/) user guide, which explains how to access and download each dataset.

The app complements [this manuscript](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1002/ecs2.4506): Meyer, Abigail V., Yutaro Sakairi, Michael R. Kearney, and Lauren B. Buckley. 2023. “A Guide and Tools for Selecting and Accessing Microclimate Data for Mechanistic Niche Modeling.” Ecosphere14(4): e4506.

This is a reconfiguration of a [previous docker Azure version](https://github.com/trenchproject/RShiny_Microclim).

## Prerequisites for opening in Rstudio
Git and Rstudio ([Instructions](https://resources.github.com/whitepapers/github-and-rstudio/))  

## Using RShiny_Microclim
* Opening in Rstudio:  
Click on "Code" on the top right to copy the link to this repository.  
Click ```File```, ```New Project```, ```Version Control```, ```Git```  
Paste the repository URL and click ```Create Project```.

## Contributing to RShiny_Microclim
<!--- If your README is long or you have some specific process or steps you want contributors to follow, consider creating a separate CONTRIBUTING.md file--->
To contribute to RShiny_Microclim, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
