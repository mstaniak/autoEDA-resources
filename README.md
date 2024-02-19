# autoEDA-resources

A list of software and papers related to automated Exploratory Data Analysis, including
   
   - fast data exploration and visualization,
   - augmented analytics,
   - visualization recommendation and other tools that speed up data exploration (visual exploration in particular).

Pull requests with software, paper and conference presentations are welcome.

# Software

## R packages

[My summary of R packages is in R Journal](https://www.researchgate.net/publication/332014513_The_Landscape_of_R_Packages_for_Automated_Exploratory_Data_Analysis)

### General Packages

- [dataMaid](https://github.com/ekstroem/dataMaid) (CRAN package) - automated checks of data validity.

- [DataExplorer](https://github.com/boxuancui/DataExplorer) (CRAN package) - automated data exploration (including univariate and bivariate plots, PCA) and  treatment.

- [funModeling](https://cran.r-project.org/package=funModeling) (CRAN package) - automated EDA, simple feature engineering and outlier detection.

- [SmartEDA](https://cran.r-project.org/package=SmartEDA) (CRAN package) - automated generation of descriptive statistics and uni- and bivariate plots, parallel coordinate plots. Details can be found in a [dedicated paper](https://www.researchgate.net/publication/331700451_SmartEDA_An_R_Package_for_Automated_Exploratory_Data_Analysis). 

- [autoEDA](https://github.com/XanderHorn/autoEDA) (GitHub package) - automated EDA with uni- and bivariate plots. An article with an introduction can be found on [LinkedIn](https://www.linkedin.com/pulse/automated-exploratory-data-analysis-r-xander-horn/).

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

- [brinton](https://cran.r-project.org/web/packages/brinton/index.html) (CRAN package) - packages for quick exploration and visualization. Details can be found in the [documentation](https://sciencegraph.github.io/brinton/).

- [AEDA](https://github.com/tuanle618/AEDA) (GitHub package) - summary statistics, correlation analysis, cluster analysis, PCA & other projections.

- [automatic-data-explorer](https://github.com/elastacloud/automatic-data-explorer/) (GitHub package) - basic EDA and creating Markdown reports from multiple R scripts.

- [xda](https://github.com/ujjwalkarn/xda) (GitHub package) - basic data summaries.

- [modeler](https://github.com/mattmills49/modeler) (GitHub package) - tools for exploration and pre-processing.

- [IEDA](https://github.com/krupanss/IEDA) (GitHub package) - EDA simplified through interactive visualization.

- [dfvis](https://github.com/talegari/dfvis) (GitHub package) - ggplot2 based implementation of tabplot.


### Domain-specific packages

- [compMS2Miner: An Automatable Metabolite Identification, Visualization, and Data-Sharing R Package for High-Resolution LC-MS Data Sets](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6338221/)

- [RBioPlot](https://github.com/jzhangc/git_R_STATS_KBS) (GitHub package) - automated data analysis and visualization for molecular biology. Details can be found [in the paper at NCBI](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5045883/).

- [ExPanDaR](https://cran.r-project.org/web/packages/ExPanDaR/index.html) - package for interactive data visualization. Designed for longitudinal data, but can be also used with other types of data after setting an artificial time variable. Shiny apps with examples are provided on the [github website of the package](https://github.com/joachim-gassen/ExPanDaR).

- [brolgar](https://github.com/njtierney/brolgar) (GitHub package) - tools to assist in longitudinal data analysis

- [POMA](https://github.com/pcastellanoescuder/POMA) (Bioconductor package) - structured, reproducible and easy-to-use workflow for the visualization, pre-processing, exploratory data analysis and statistical analysis of mass spectrometry data. POMA R/Shiny version available [here](https://github.com/pcastellanoescuder/POMAShiny).


### Related packages

- [featuretoolsR](https://github.com/magnusfurugard/featuretoolsR) (CRAN package) - R port to Python library for automated feature engineering.

- [vtreat](https://cran.r-project.org/web/packages/vtreat/index.html) (CRAN package) - data treatment (pre-processing) that includes dealing with missing data and large categorical variables. Details can be found in the [paper about vtreat](https://arxiv.org/pdf/1611.09477.pdf).

- [report](https://github.com/easystats/report) - automated modeling report generation.

- [FactoInvestigate](http://factominer.free.fr/reporting/index.html) (CRAN package) - has an automatic reporting module which selects best plots that summarise different projection techniques. 

- [gtsummary](https://github.com/ddsjoberg/gtsummary) (GitHub package) - presentation-ready tables summarizing data sets, regression models, and more.

- [clean](https://github.com/msberends/clean) (CRAN package) - fast data cleaning.

- [finalfit](https://cran.r-project.org/package=finalfit) (CRAN package) - tables and plots to quickly visualize regression results.

- [modelsummary](https://github.com/vincentarelbundock/modelsummary) (GitHub package) - summary tables for regression models.


## Python libraries

### General Packages

- [DataPrep](https://github.com/sfu-db/dataprep) (pip library) - data preparation library with an EDA package. [Paper about the package](https://arxiv.org/pdf/2104.00841.pdf)

- [Dora](https://github.com/NathanEpstein/Dora) (pip library) - data cleaning, featuring engineering and simple modeling tools.

- [statsModels](http://www.statsmodels.org) (pip library) - collection of statistical tools, including EDA.

- [TPOT](https://github.com/EpistasisLab/tpot) (pip library) - autoML tool with feature engineering module.
 
- [HoloViews](https://github.com/pyviz/holoviews) (pip library) - automated visualization based on short data annotations.

- [lens](https://github.com/facultyai/lens) (pip library) - fast calculation of summary statistics and correlations. [Presentation about the library](https://www.slideshare.net/VictorZabalza/automated-data-exploration-building-efficient-analysis-pipelines-with-dask-81328214).

- [pandas-profiling](https://github.com/pandas-profiling/pandas-profiling) - popular library for quick data summaries and correlation analysis.

- [speedML](https://speedml.com) (pip library) - large library for ML with module dedicated to fast EDA. 

- [edaviz](https://github.com/FlorianWetschoreck/edaviz) - Python library for fast data exploration that provides functions for dataset overviews, bivariate plots and finding good predictors. (Free version only works for small datasets).

- [AutoViz](https://github.com/AutoViML/AutoViz) - Python library for automated visualization.

- [ExploriPy](https://github.com/exploripy/exploripy) - Python library for various EDA tasks.

- [pandas-summary](https://github.com/mouradmourafiq/pandas-summary) - simple extension to pandas.describe.

- [sweetviz](https://github.com/fbdesignpro/sweetviz) - visualizations for automated EDA.

### Related packages

- [featuretools](https://www.featuretools.com/) - library for automated feature engineering.

- [pyvtreat](https://github.com/WinVector/pyvtreat) - Python version of the R's vtreat package.

- [autoimpute](https://github.com/kearnz/autoimpute) - easier handling of missing values.

- [Auto_TS](https://github.com/AutoViML/Auto_TS) - automated time series modeling.

## Stata packages

- [eda](https://github.com/wbuchanan/eda) - a package that produces a pdf report with all permutations of univariate and bivariate visualizations and tables. Notably, three-dimensional displays are also possible.


## Web services

- [DIVE](https://www.usedive.com/) - MIT's tools for data exploration that tries to choose best (most informative) visualizations.

- [Automatic Statistician](https://automaticstatistician.com/index/) - tool for automated EDA and modeling.

- Several Shiny apps by R Squared Computing, including [visulizer](https://www.rsquaredcomputing.com/shiny/xplorerr/) and [descriptr](https://www.rsquaredcomputing.com/shiny/descriptr/).


## Standalone software

- [auto-eda](https://github.com/darenasc/auto-eda) - automatic EDA with SQL.

- [elycite](http://lrei.github.io/elycite/) - tools for exploration and modelling available (locally) as an web application. Designed for NLP problems.


# Papers and short articles

## Methods and tools for autoEDA

- [Datamations: Animated Explanations of Data Analysis Pipelines](https://dl.acm.org/doi/abs/10.1145/3411764.3445063)
- [Interactive Data Exploration with “Big Data Tukey Plots”](http://www.absolutedc.com/resources/pdf/tukey.pdf) - automated visualization of big data.
- [Extracting Top-K Insights from Multi-dimensional Data](http://www4.comp.polyu.edu.hk/~csbtang/pub/SIGMOD17_insight.pdf).
- [Agency plus Automation: Designing Artificial Intelligence into Interactive Systems](http://idl.cs.washington.edu/files/2019-AgencyPlusAutomation-PNAS.pdf)
- [The Landscape of R Packages for Automated Exploratory Data Analysis](https://journal.r-project.org/archive/2019/RJ-2019-033/RJ-2019-033.pdf)
- [Issues in Automating Exploratory Data Analysis](https://pdfs.semanticscholar.org/ce09/ef8113c473e78c1896989d6ab6dd01fa9706.pdf)
- [Automating anomaly detection for exploratory data analytics](https://ieeexplore.ieee.org/abstract/document/8365228)
- [Task-Oriented Optimal Sequencing of Visualization Charts](https://arxiv.org/abs/1908.02502)
- [A Rank-by-Feature Framework for Interactive Exploration of Multidimensional Data](https://www.cs.umd.edu/hcil/hce/presentations/seo_shneiderman_rff_ivs.pdf) - A paper that describe many measures that can be used to sort 1d and 2d data displays.
- [Towards a benefit-based optimizer for Interactive Data Analysis](http://ceur-ws.org/Vol-2324/Paper16-PMarcel.pdf)
- [Spotfire: an information exploration environment](https://dl.acm.org/citation.cfm?id=245893)
- [AlphaClean: Automatic Generation ofData Cleaning Pipelines](https://arxiv.org/pdf/1904.11827.pdf)
- [Testing MS Excel's autoEDA tool](https://medium.com/datadriveninvestor/automated-exploratory-data-analysis-test-driving-ms-excels-ideas-feature-514f34d944e8#9cad-50ae56ae88ac)

## Visualization recommendation frameworks

- [Foresight: Recommending Visual Insights](http://www.vldb.org/pvldb/vol10/p1937-parthasarathy.pdf) - Foresight is a system that helps the user rapidly discover visual insights from large high-dimensional datasets.
- [DIVE: A Mixed-Initiative System Supporting Integrated Data Exploration Workflows](https://www.usedive.com/assets/DIVE_HILDA_2018.pdf). The web app is available on [MIT website](https://www.usedive.com/).
- [Voyager: Exploratory Analysis via Faceted Browsing of Visualization Recommendations](https://ieeexplore.ieee.org/document/7192728).
- [Voyager 2: Augmenting Visual Analysis with Partial View Specifications](https://idl.cs.washington.edu/files/2017-Voyager2-CHI.pdf)
- [VizML: A Machine Learning Approach to Visualization Recommendation](https://dl.acm.org/citation.cfm?id=3300358)
- [VizDeck: Streamlining Exploratory Visual Analytics of Scientific Data](https://faculty.washington.edu/billhowe/publications/pdfs/perry2013vizdeck.pdf)
- [Taggle: Scalable Visualization of Tabular Data through Aggregation](https://sci.utah.edu/~vdl/papers/2017_preprint_taggle.pdf)

## Augmented analytics

- [Augmenting Visualizations with Interactive Data Facts to Facilitate Interpretation and Communication](https://arjun010.github.io/static/papers/voder-infovis18.pdf).

# Conference presentations

- [Automating exploratory data analysis tasks with eda - Billy Buchanan](https://wbuchanan.github.io/stataConference2018/)
