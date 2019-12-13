MeLMSens

To do:
- Script on the R side to create all the figures
- Arrange for the figures to be copied to or created within the paper DropBox directory

MATLAB operations
1) `exportAllResultsToCSV` - This reads the raw data from DropBox and saves processed data into the local (within this repo) data directory
2) Make individual figures:
	`MeLMSens_SteadyAdapt.schematic.trialSchematic`
	`MeLMSens_SteadyAdapt.schematic.sessionSchematic`
	`MeLMSens_Pulse.schematic.trialSchematic`
	`MeLMSens_Pulse.schematic.sessionSchematic`


R operations
1) Install R if not already present (e.g., http://cran.wustl.edu/bin/macosx/). Use latest version from R-project.org
2) Install RStudio (https://rstudio.com/products/rstudio/download/)
3) Launch RStudio.app
4) Install R packages:
	a) In RStudio, select the "Packages" tab in the bottom right panel
	b) Click the "Install" button at the top of the panel
	c) In the text entry box, type `tidyverse, here` and then press install.
        d) Type 'Yes' when asked about whether you want to install
	e) Do not be alarmed by the crawl of red text in the console window
5) Within RStudio:
	a) From the top right corner, choose "Open Project..."
	b) Select the file "MeLMSens.Rproj" that is in the top level of the MeLMSens project repo
	c) To create the results figures: In the RStudio console window, type:
		`source('R/JNDs.makefig.R')`
		`make_figures_JNDs()`
	d) To create the threshold splatter figures: In the RStudio console window, type:
		`source('R/splatter.makefig.R')`
		`make_figure_splatter_threshold_background_adapt()`



