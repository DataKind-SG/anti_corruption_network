# Exploratory analysis
## Structure
Data is stored in `sample-dataset` and `full-dataset` folders. Sample dataset contains a 1% random sample of procurement data to quickly verify whether code runs.
Separate .R files contain logic to load data and conduct analysis.
`output` folder should contain any visualization or other output. Using d3.js based R packages is encouraged as their outputs can be rendered as a static web site on Amazon S3 using [htmlwidgets](http://www.htmlwidgets.org/showcase_leaflet.html).
## Usage
1. Copy thai procurement data CSV into `full-dataset` folder. Can be downloaded [here](https://drive.google.com/drive/folders/0B3DvvWPyWRa6T0R3cks2VjFzNTg)
2. Load data by running `1-load-data.R` script
3. Do data analysis in separate scripts
4. Save output, visualization in `output` folder
## Conventions
Recommended packages:
* `data.table` for storing data in memory instead of `data.frame`
* `dplyr` for data cleaning, manipulation and basic computations instead of `data.table` or `data.frame` syntax
* d3.js-based visualization for interactivity instead of static plots. See a list of libraries on [htmlwidgets](http://www.htmlwidgets.org/showcase_leaflet.html)
Recommended syntax:
* Use type of variable as prefix, e.g. "dt" for data.table, "s" for string, "v" for vector etc.
* Words in variable names are separated by dot (.)
* Use `<-` instead of `=`

