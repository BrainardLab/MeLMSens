MeLMSens

To do:
- Script on the R side to create all the figures
- Arrange for the figures to be copied to or created within the paper DropBox directory
- Need to get the OLApproach_Psychophysics project on the path. For now might state that this needs to be done by hand after tbuseproject
- This could be done by having an add path command within MeLMSens local hook to add the OLApproach_Psychophysics

*** [OLApproach_Psychophysics is added explicitly in the .json config file.  Is this OK, or does more need to be done?]

- Need to resolve / merge the "dev" branch of OneLightToolbox

*** [THIS APPEARS TO BE DONE]

MATLAB operations
1) `exportAllResultsToCSV` - This reads the raw data from DropBox and saves processed data into the local (within this repo) data directory

*** [THIS PRODUCES WARNINGS: "Warning: Variable 'acquisition' originally saved as a Acquisition_FlickerSensitivity_2IFC cannot be instantiated as an object and will be read in as a uint32." etc. Is this OK?  If so, let's state here to ignore the warnings.  If not, need to fix.]

*** [FAILS WITH ERROR AS POSTED ON SLACK DECEMBER 11.]

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



