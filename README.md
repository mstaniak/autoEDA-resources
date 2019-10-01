# autoEDA-resources

A list of software and papers related to automated Exploratory Data Analysis, including
   
   - fast data exploration and visualization,
   - augmented analytics,
   - visualization recommendation and other tools that speed up data exploration (visual exploration in particular).

Pull requests with software, paper and conference presentations are welcome.

# Software

## R packages

[My summary of R packages is in R Journal](https://journal.r-project.org/archive/2019/RJ-2019-033/index.html)

### Complete Packages

- [dataMaid](https://github.com/ekstroem/dataMaid) (CRAN package) - automated checks of data validity.

- [DataExplorer](https://github.com/boxuancui/DataExplorer) (CRAN package) - automated data exploration (including univariate and bivariate plots, PCA) and  treatment.

- [funModeling](https://cran.r-project.org/package=funModeling) (CRAN package) - automated EDA, simple feature engineering and outlier detection.

- [SmartEDA](https://cran.r-project.org/package=SmartEDA) (CRAN package) - automated generation of descriptive statistics and uni- and bivariate plots, parallel coordinate plots. Details can be found in a [dedicated paper](https://www.researchgate.net/publication/331700451_SmartEDA_An_R_Package_for_Automated_Exploratory_Data_Analysis). 

- [autoEDA](https://github.com/XanderHorn/autoEDA) (GitHub package) - automated EDA with uni- and bivariate plots. An article with an introduction can be found on [LinkedIn](https://www.linkedin.com/pulse/automated-exploratory-data-analysis-r-xander-horn/).

    * [auto-EDA](https://github.com/souravbose1991/Auto-EDA) (GitHub package) - uni- and bivariate plots for data exploration in regression and classification problem. The package cleans data automatically to improve the plots. Another version of Xander Horn's package.

- [visdat](https://github.com/ropensci/visdat) (CRAN package) - 6 exploratory/diagnostic plots for initial data analysis.

- [dlookr](https://cran.r-project.org/web/packages/dlookr/) (CRAN package) - tools for data quality diagnosis, basic exploration and feature transformations.

- [xray](https://cran.r-project.org/package=xray) (CRAN package) - first look at the data - distributions and anomalies. More in the [blog post](https://www.r-bloggers.com/xray-the-r-package-to-have-x-ray-vision-on-your-datasets/).

- [arsenal](https://cran.r-project.org/package=arsenal) (CRAN package) - statistical summaries (models and exploration) and quick reporting.

- [RtutoR](https://cran.r-project.org/package=RtutoR) (CRAN package) - learning material with a automatic reports module. More at [R-Bloggers](https://www.r-bloggers.com/automating-basic-eda/).

- [exploreR](https://cran.r-project.org/package=exploreR) (CRAN package) - exploration based on univariate linear regression.

- [summarytools](https://cran.r-project.org/package=summarytools) (CRAN package) - table to summarise datasets and perform simple uni- and bivariate analyses.

- [inspectdf](https://cran.r-project.org/web/packages/inspectdf/index.html) (CRAN package) - tools for column-wise exploration and comparison of data frames. Examples are provided in a README of the [GitHub repo](https://github.com/alastairrushworth/inspectdf).

- [explore](https://cran.r-project.org/package=explore) (CRAN package) - interactive Shiny app for comprehensive dataset exploration (including uni- and bivariate relationships, correlation analysis and simple modeling with decision trees) and stand-alone function for quick exploration. Examples are given in a [vignette](https://cran.r-project.org/web/packages/explore/vignettes/explore.html).

- [skimr](https://cran.r-project.org/package=skimr) (CRAN package) - well formatted summaries of data frames, vector and matrices. Examples are provided in a [vignette](https://cran.r-project.org/web/packages/skimr/vignettes/Using_skimr.html).

- [janitor](https://cran.r-project.org/package=janitor) (CRAN package) - a tools for fast data cleaning. All functionalities are introduced in the [vignette](https://cran.r-project.org/web/packages/janitor/vignettes/janitor.html).

- [autoplotly](https://cran.r-project.org/package=autoplotly) (CRAN package) - a library for fast visualization of statistical results supported by ggfortify. Details can be found in the [vignette](https://cran.r-project.org/web/packages/autoplotly/vignettes/intro.html) or [JOSS paper](https://joss.theoj.org/papers/10.21105/joss.00657)

### Packages in Development

- [AEDA](https://github.com/tuanle618/AEDA) (GitHub package) - summary statistics, correlation analysis, cluster analysis, PCA & other projections.

- [dataexpks](https://github.com/DublinLearningGroup/dataexpks) (GitHub package) - quick reports with basic data summaries.

- [automatic-data-explorer](https://github.com/elastacloud/automatic-data-explorer/) (GitHub package) - basic EDA and creating Markdown reports from multiple R scripts.

- [xda](https://github.com/ujjwalkarn/xda) (GitHub package) - basic data summaries.

- [EDA](https://github.com/JamesDavidLawrence/EDA) - stub of a package.

- [modeler](https://github.com/mattmills49/modeler) (GitHub package) - tools for exploration and pre-processing.

- [IEDA](https://github.com/krupanss/IEDA) (GitHub package) - EDA simplified through interactive visualization.

- [seda](https://github.com/bruno-pinheiro/seda) (GitHub package) - fast EDA tool in active development.

### Domain-specific packages

- [compMS2Miner: An Automatable Metabolite Identification, Visualization, and Data-Sharing R Package for High-Resolution LC-MS Data Sets](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6338221/)

- [RBioPlot](https://github.com/jzhangc/git_R_STATS_KBS) (GitHub package) - automated data analysis and visualization for molecular biology. Details can be found [in the paper at NCBI](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5045883/).

- [ExPanDaR](https://cran.r-project.org/web/packages/ExPanDaR/index.html) - package for interactive data visualization. Designed for longitudinal data, but can be also used with other types of data after setting an artificial time variable. Shiny apps with examples are provided on the [github website of the package](https://github.com/joachim-gassen/ExPanDaR).

### Related packages

- [featuretoolsR](https://github.com/magnusfurugard/featuretoolsR) (CRAN package) - R port to Python library for automated feature engineering.

- [vtreat](https://cran.r-project.org/web/packages/vtreat/index.html) (CRAN package) - data treatment (pre-processing) that includes dealing with missing data and large categorical variables. Details can be found in the [paper about vtreat](https://arxiv.org/pdf/1611.09477.pdf).

- [report](https://github.com/easystats/report) - automated modeling report generation.

- [FactoInvestigate](http://factominer.free.fr/reporting/index.html) (CRAN package) - has an automatic reporting module which selects best plots that summarise different projection techniques. 

- [gtsummary](https://github.com/ddsjoberg/gtsummary) (GitHub package) - presentation-ready tables summarizing data sets, regression models, and more.

## Python libraries

### Complete Packages

- [Dora](https://github.com/NathanEpstein/Dora) (pip library) - data cleaning, featuring engineering and simple modeling tools.

- [statsModels](http://www.statsmodels.org) (pip library) - collection of statistical tools, including EDA.

- [TPOT](https://github.com/EpistasisLab/tpot) (pip library) - autoML tool with feature engineering module.
 
- [HoloViews](https://github.com/pyviz/holoviews) (pip library) - automated visualization based on short data annotations.

- [lens](https://github.com/facultyai/lens) (pip library) - fast calculation of summary statistics and correlations. [Presentation about the library](https://www.slideshare.net/VictorZabalza/automated-data-exploration-building-efficient-analysis-pipelines-with-dask-81328214).

- [pandas-profiling](https://github.com/pandas-profiling/pandas-profiling) - popular library for quick data summaries and correlation analysis.

- [speedML](https://speedml.com) (pip library) - large library for ML with module dedicated to fast EDA. 

- [edaviz](https://github.com/FlorianWetschoreck/edaviz) - Python library for fast data exploration that provides functions for dataset overviews, bivariate plots and finding good predictors. (Free version only works for small datasets).

### Packages in Development

- [basic-auto-EDA](https://github.com/AnkushAppy/basic-auto-eda) (GitHub library) - automatic report generation.

- [automated_EDA](https://github.com/hari2594/Automated_EDA) - stub of a library.

- [python-summary](https://github.com/mouradmourafiq/pandas-summary) - simple extension to pandas.describe.

### Related packages

- [featuretools](https://www.featuretools.com/) - library for automated feature engineering.

- [pyvtreat](https://github.com/WinVector/pyvtreat) - Python version of the R's vtreat package.

## Stata packages

- [eda](https://github.com/wbuchanan/eda) - a package that produces a pdf report with all permutations of univariate and bivariate visualizations and tables. Notably, three-dimensional displays are also possible.

## Web services

- [DIVE](https://dive.media.mit.edu/) - MIT's tools for data exploration that tries to choose best (most informative) visualizations.

- [Automatic Statistician](https://automaticstatistician.com/index/) - tool for automated EDA and modeling.

- Several Shiny apps by R Squared Computing, including [visulizer](https://www.rsquaredcomputing.com/shiny/xplorerr/) and [descriptr](https://www.rsquaredcomputing.com/shiny/descriptr/).

## Standalone software

- [auto-eda](https://github.com/darenasc/auto-eda) - automatic EDA with SQL.

- [elycite](http://lrei.github.io/elycite/) - tools for exploration and modelling available (locally) as an web application. Designed for NLP problems.

# Papers

## Methods and tools for autoEDA

- [Interactive Data Exploration with “Big Data Tukey Plots”](http://www.absolutedc.com/resources/pdf/tukey.pdf) - automated visualization of big data.
- [Extracting Top-K Insights from Multi-dimensional Data](http://www4.comp.polyu.edu.hk/~csbtang/pub/SIGMOD17_insight.pdf).
- [Agency plus Automation: Designing Artificial Intelligence into Interactive Systems](http://idl.cs.washington.edu/files/2019-AgencyPlusAutomation-PNAS.pdf)
- [The Landscape of R Packages for Automated Exploratory Data Analysis](https://journal.r-project.org/archive/2019/RJ-2019-033/index.html)
- [Issues in Automating Exploratory Data Analysis](https://pdfs.semanticscholar.org/ce09/ef8113c473e78c1896989d6ab6dd01fa9706.pdf)
- [Automating anomaly detection for exploratory data analytics](https://ieeexplore.ieee.org/abstract/document/8365228)
- [Task-Oriented Optimal Sequencing of Visualization Charts](https://arxiv.org/abs/1908.02502)
- [A Rank-by-Feature Framework for Interactive Exploration of Multidimensional Data](https://www.cs.umd.edu/hcil/hce/presentations/seo_shneiderman_rff_ivs.pdf) - A paper that describe many measures that can be used to sort 1d and 2d data displays.
- [Towards a benefit-based optimizer for Interactive Data Analysis](http://ceur-ws.org/Vol-2324/Paper16-PMarcel.pdf)


## Visualization recommendation frameworks

- [Foresight: Recommending Visual Insights](http://www.vldb.org/pvldb/vol10/p1937-parthasarathy.pdf) - Foresight is a system that helps the user rapidly discover visual insights from large high-dimensional datasets.
- [DIVE: A Mixed-Initiative System Supporting Integrated Data Exploration Workflows](https://dive.media.mit.edu/assets/DIVE_HILDA_2018.pdf). The web app is available on [MIT website](https://dive.media.mit.edu/).
- [Voyager: Exploratory Analysis via Faceted Browsing of Visualization Recommendations](https://ieeexplore.ieee.org/document/7192728).
- [Voyager 2: Augmenting Visual Analysis with Partial View Specifications](https://idl.cs.washington.edu/files/2017-Voyager2-CHI.pdf)
- [VizML: A Machine Learning Approach to Visualization Recommendation](https://dl.acm.org/citation.cfm?id=3300358)
- [VizDeck: Streamlining Exploratory Visual Analytics of Scientific Data](https://faculty.washington.edu/billhowe/publications/pdfs/perry2013vizdeck.pdf)

## Augmented analytics

- [Augmenting Visualizations with Interactive Data Facts to Facilitate Interpretation and Communication](https://arjun010.github.io/static/papers/voder-infovis18.pdf).

# Conference presentations

- [Automating exploratory data analysis tasks with eda - Billy Buchanan](https://wbuchanan.github.io/stataConference2018/)
