# Load all required packages
library(archivist)
library(xtable)
library(visdat)
library(arsenal)
library(DataExplorer)
library(dataMaid)
library(autoEDA)
library(SmartEDA)
library(xray)
library(funModeling)
library(dlookr)
library(summarytools)
library(exploreR)
# Set up archivist repo
# archivist::createLocalRepo(".")
# Load data from visdat package
data('typical_data', package = 'visdat')
head(typical_data)
example_data <- typical_data[1:1000, ]
# archivist::asave(example_data, repoDir = ".")
# "278c7e64ab715cf36d0233056e18e1b9",
# visdat example
visdat_guess <- vis_guess(example_data)
# archivist::asave(visdat_guess, repoDir = ".")
# "3cfdbe646b346faecbc5ca81a94cfab0"
# "e7a978e82860d048dae65949b3df8ee8"
# xray example
xray_distributions <- xray::distributions(example_data)
# archivist::asave(xray_distributions, repoDir = ".")
# "a3a378b298cf10866d2fe7a90de07caf"
# arsenal example
arsenal_table  <- arsenal::tableby(Died ~ Smokes + Race, data = example_data)
# archivist::asave(arsenal_table, repoDir = ".")
# "d951275744c612f3fc5843a034f82e90"
# write2(arsenal_table, file = "./autoEDA-paper/plots/arsenaltable", output_format = "pdf",
#        render. = TRUE)
# funModeling example
funmodeling_cross <- funModeling::cross_plot(example_data[, -c(1, 8)], target = "Died",
                                             plot_type = "both",
                                             path_out = "./plots/funmodeling/")
# The plots are side effect of the function. All plots are saved separately to jpeg files.
# dlookr example
dlookr::transformation_report(example_data[, -1],
                   output_format = "html",
                   output_file = "dlookr_transf.html",
                   output_dir = "./plots/")
# DataExplorer example
DataExplorer::create_report(example_data, y = "Died", output_dir = "./plots/DataExplorer",
                            output_file = "dataexplorer_report.html")
cor_DE <- DataExplorer::plot_correlation(example_data, maxcat = 6)
# archivist::asave(cor_DE, repoDir = ".")
# "05268dfebb7d83820c98ac3da1e25096"
# "f64fa0bd057a6c0d536fdfe71301b31c"
# autoEDA example
autoEDA::autoEDA(example_data, y = "Died", outputPath = "./plots/", filename = "autoEDA_report")
# dataMaid example
dataMaid::makeDataReport(example_data, output = "pdf",
                         file = "./plots/dataMaid/dataMaid_report.pdf")
# SmartEDA example
colnames(example_data) <- stringr::str_replace_all(colnames(example_data), "\\(", "_")
colnames(example_data) <- stringr::str_replace_all(colnames(example_data), "\\)", "_")
# archivist::asave(example_data, repoDir = ".")
# "baaea26dc137370dbcaf42c122b4d2eb"
SmartEDA::ExpReport(example_data, Target = "Died", op_file = "smarteda_report2.html",
                    op_dir = "./plots/SmartEDA/")
# summarytoools example
summarytools_uni <- summarytools::descr(example_data)
# archivist::asave(summarytools_uni, repoDir = ".")
# "9e12d5686918a5ad1c34c6857b0143df"
# exploreR example
exploreR::massregplot(dplyr::rename(example_data, Height = `Height(cm)`), "IQ",
                      ignore = c("ID", "Income", "Died"), include.factors = T,
                      save = "plots/exploreR.pdf")
