# BMEG 310 Project Overview (UNDER DEVELOPMENT)

## General

The purpose of the project is to give students the opportunity to apply their understanding of course fundamentals to real data. Students will be organised into teams and given a TCGA cancer dataset to analyze, with the goal that they will capture biologically relevant trends characteristic of the cancer in question. 

## Project kick-off date
**October 14** 

## Project timelines
Please check Canvas for deadlines. 

## Teams and project topics

Students have been organised into teams of 3 (rarely, 2 or 4) to complete the project.  

- Groups 1-7: BRCA
  - [Breast Invasive Carcinoma (TCGA, PanCancer Atlas)](https://www.cbioportal.org/study?id=brca_tcga_pan_can_atlas_2018)
- Groups 8-13: BLCA
  - [Bladder Urothelial Carcinoma (TCGA, PanCancer Atlas)](https://www.cbioportal.org/study?id=blca_tcga_pan_can_atlas_2018)
- Groups 14-20: LIHC
  - [Liver Hepatocellular Carcinoma (TCGA, PanCancer Atlas)](https://www.cbioportal.org/study?id=lihc_tcga_pan_can_atlas_2018)
- Groups 21-27: LUSC
  - [Lung Squamous Cell Carcinoma: LUSC (TCGA, PanCancer Atlas)](https://www.cbioportal.org/study?id=lusc_tcga_pan_can_atlas_2018)
- Groups 28-32: KIRC
  - [Kidney Renal Clear Cell Carcinoma (TCGA, PanCancer Atlas)](https://www.cbioportal.org/study?id=kirc_tcga_pan_can_atlas_2018)
- Groups 33-39: PRAD
  - [Prostate Adenocarcinoma (TCGA, PanCancer Atlas)](https://www.cbioportal.org/study?id=prad_tcga_pan_can_atlas_2018)

## Process

In this project you will perform analysis on a TCGA Cancer dataset similarly to https://pubmed.ncbi.nlm.nih.gov/28988769/. In other words, we would like teams to use methods they have learned in the lectures, tutorials and assignments, such as clustering, regression, classification, differential expression, survival analysis, and visualization methods (among other approaches) to show that some trend of the Cancer type in question may be explained by characteristics of certain genes, and the potential mechanisms implicated. 
The teaching team will provide a roadmap for the project analysis that will be considered as the minimum amount of work that needs to be carried out during the project.
Groups will be free to choose from different approaches and algorithms to perform their analysis and may investigate any trends they find in the data. Groups will also be expected to interpret the results of their data and propose biological explanations for the trends they see. This will be an important part of the project and the expectation is that each team will derive different conclusions from the data that they have analyzed.

Dos: 
 *  Do: look at other papers for examples of what kinds of things you could try (e.g. below)
 *  Don't: try to recapitulate the analysis from a published paper. This project is about data exploration, not about recreating the "correct" answer.

### Examples:

Here are a couple examples of papers that explore similar datasets. 
 * https://www.cell.com/cell/fulltext/S0092-8674(17)31056-5
 * https://www.nature.com/articles/ng.3849



### Data

You will be using datasets from The Cancer Genome Atlas (TCGA) containing variant calls, expression levels, and comprehensive individual data for many patients who underwent treatment for the same cancer type. Each team will be randomly assigned a dataset for analysis. 

You will only need to use the mutation, expression and clinical data. No other datasets (e.g., methylation, miRNA, etc.) are expected to be used.

You can download the dataset associated with your project from the following link: [Link](https://drive.google.com/drive/folders/1YK_x1-pTjwAlICbMRN49Z-HAHvlJZGBZ)

Within each dataset are 3 files of importance:

**data_clinical_patient.txt** : contains a list of patients with data on each individual such as Age, Sex, Race, and Survival

**data_mutations.txt** : contains a list of mutations and a list of patients in which they are found for each

**RNA-Seq count matrix** : contains a set of expression levels for all genes for each patient 


#### Instructions to download data for other cancers (We have already provided the data. These instructions are useful in case in the future you would want to download other TCGA datasets)

You can get the <u>first two datasets</u> from the link associated with the project name (highlighted in yellow in the figure below). You will be redirected to a page where you can download all the data as shown here in the upper left corner. First download all the data related to your project as a zip file, then select these two **.txt** files

<img src="img.jpg" style="zoom:50%;" />



These files will be used for the bulk of the analysis. All major data preprocessing steps, including dataset normalization, have already been performed for the variant and expression level files, so the remaining analysis steps may all be completed using only R. Given the information available in the patient file, the major areas of investigation will be to tie patient traits to expression levels and mutations of certain genes. One of the major patient traits to explore is the overall survival, which permits survival analysis, although groups are welcome to explore other patient traits if they wish. 

Gene expression data can be downloaded following this instruction [here](https://htmlpreview.github.io/?https://github.com/AIMLab-UBC/BMEG310-2023/blob/main/FinalProject/Instruction_TCGA_RNAseq.html)


### Research Process

The research process is the list of steps that are taken to extract relevant information from the data and assess it to look for trends. Groups should take a look at their data, follow the provided roadmap and come up with an outline of the steps they plan to take during analysis and the type of results to be expected. This notably should include any preferred classification/clustering/regression algorithms, which patient variables will be used, and how expression and variant data will each be used. This should be organised as a list of steps, ie. a pipeline or workflow, to show how information will be processed each step of the way from the base data to the final result. It is also recommended to develop a timeline for completing each step in the workflow. Instructors and TAs will be able to give feedback to make sure the approach is feasible and offer suggestions for improvement.

As teams explore the data, they will need to look for trends related to the activity/mutation of certain genes and the many patient factors which are available. This search will likely take some trial and error as different data factors are investigated and considered (it may be sped up with procedures such as multiple hypothesis testing), but teams should try to formulate a research question detailing how they will design their pipeline to expressly look for these trends. Students may look at other investigations such as the TCGA paper linked to above (in Process section) for inspiration. Again, instructors and TAs will review proposals and provide feedback to ensure students are on the right track.

## Deliverables
There are three components (Parts 1-3) for project deliverables. Requirements for each have been outlined below.  

**Part 1. Project Report 1: Mutation analysis** 

* Purpose: finish mutational and clinical data analysis parts of the project. The report should be organised and contain the following sections:  
    * **Key finidngs:** Should summarize the key findings of the analysis in up to 5 bullet points.
    * **Overall Analysis Workflow:** Give a description of your analysis workflow including the algorithms (approaches) you have tried (or will try) and the patient variables you have investigated. This is the most important part of this report. You are required to include a flowchart of all the analysis.
    * **Results:** Should provide an itemized list of investigations and analysis you have performed, along with the findings of such an analysis. Every result or claim needs to be backed up by R markdown code as well as accompanying outputs and figures/flowcharts. Organize every investigation into a sub-section in the results section. You would need to include at least 5 investigations in the results section. The quality (rather than quantity) of the analysis will be key in grading.
    * **Challenges:** Use this section to address any difficulties you are encountering, or expect you will encounter as you make progress with the project. This may include limitations of a current approach or a lack of meaningful results. Please explain why you believe this problem is occurring, and highlight any limitations in your data you have found. 
    * **Duties and contributions:** For each group member, provide a list of work done and tasks to which they have contributed (if any), as well as a list of tasks to which they are assigned moving forward. Note, writing reports/preparing the presentation are also project tasks and should be listed.
* The report should not be longer than 20 pages in 11 point font Times New Roman.
* This report (as a pdf file) should be uploaded to Canvas.


**Part 2. Project Report 2 and presentations**
This section will be updated!
