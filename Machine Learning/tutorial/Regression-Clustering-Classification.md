# **Getting Started with Regression, Clustering, and Classification in R**



Machine learning is a collection of modern statistical methods which try to create a model based on underlying (training) data to predict outcomes on new data fed into the model. Some common Machine Learning fields are:

1. **Regression**
2. **Clustering**
3. **Classification**



#### **1. Linear Regression in R**



**1a. What is linear regression?**	

Linear regression analyzes the relationship between a response variable (y) and one or more variables and their interactions (x or other explanatory variables). Example: based on the height and age of a plant, the number of days to the harvest can be guessed.



**1b. Creating Linear Regression in R**

Linear regression assumes a linear relationship between response variable and explanatory variables, which means that a line can be fitted between these variables.

​				

​				Load the ‘example_linear-reg_dataset1.xls’ dataset provided to you. 



Here, we will calculate the height of a child through age. The below equation can be for this purpose:

​				*Height=a+Age∗b*



​				“a” → intercept (value from where you start measuring). Example: Newborn babies with zero months are not zero centimeters. Their initial height is the intercept.
​				“b” → slope (measures change of height wrt age in months). As the child grows older, each month his/her height will increase by “b”.



Now to calculate the linear regression in R (i.e., calculate height based on child’s age), we will use the command ‘lm’.

​				*lm([target variable] ~ [predictor variables], data = [data source])*	



Execute the following commands in R:

`install.packages("readxl")`

`library(readxl)`

`data_reg <- read_excel("example_linear-reg_dataset1.xls", sheet = "Hoja2")`

`lmHeight = lm(height~age, data = data_reg)`

`summary(lmHeight)`



You should get the following result:
**Call:**

**lm(formula = height ~ age, data = data_reg)**

**Residuals:**   

**Min    1Q  Median    3Q   Max**

**-0.36096 -0.19706 0.00408 0.09411 0.55408** 

**Coefficients:**

​				      	**Estimate** 	**Std. Error** 	  **t value** 	  **Pr(>|t|)**

**(Intercept)** 	 **56.54138**  	**0.37012** 		**152.76** 		**< 2e-16 **\***

**age**     		  	**0.98497**  	  **0.02331**  		**42.26** 		  **1.32e-12 \**\***

**---Signif. codes: 0 ‘\**\***’ **0.001 ‘\**’ 0.01 ‘\*’ 0.05 ‘.’ 0.1 ‘ ’ 1**
**Residual standard error: 0.2787 on 10 degrees of freedom**

**Multiple R-squared: 0.9944,**	**Adjusted R-squared: 0.9939** 

**F-statistic: 1786 on 1 and 10 DF, p-value: 1.321e-12**



You can see detailed information on the model’s performance and coefficients.



**1c. Coefficients and Residuals**	

The underlines text below, are the values of the intercept and slope for the age which plot a line between all points of the data.

**Coefficients:**      	

​						  **Estimate** 	**Std. Error** 	**t value** 		**Pr(>|t|)**  

<u>**(Intercept)**</u> 	<u>**56.54138**</u>  	**0.37012** 		**152.76** 	   **< 2e-16 \**\*****

<u>**age**</u>      			 <u>**0.98497**</u>  	  **0.02331**  		**42.26** 		**1.32e-12 \**\***



Additionally, when two or more predictors are used to create linear regression, it’s then called multiple linear regression. Thus, if we add number of siblings to the calculation, then height of the child should actually be:

​				*Height = a + Age × b1 + (Number of Siblings} × b2*



Here, height is a function of age (in months) and the number of siblings the child has. 

`lmHeight2 = lm(height~age + no_siblings, data = data_reg)`

`summary(lmHeight2)`



You should get the following result:
**Call:**

**lm(formula = height ~ age + no_siblings, data = data_reg)**

**Residuals:**   **Min    1Q  Median    3Q   Max** 

**-0.37548 -0.15833 0.01667 0.11452 0.50881** 

**Coefficients:**

​				      	**Estimate** 	**Std. Error** 	**t value** 		**Pr(>|t|)** 

**(Intercept)** 	**56.55333**  	**0.37933** 	    **149.088** 	   **< 2e-16 \**\***

**age**     			  **0.97500**  	  **0.02746** 	    **35.504** 	     **5.52e-11 \**\***

**no_siblings** 	**0.04071**  	  **0.05551**  	   **0.733**  	      **0.482**  

**---Signif. codes: 0 ‘\*****\****’ 0.001 ‘\**’ 0.01 ‘\*’ 0.05 ‘.’ 0.1 ‘ ’ 1**

**Residual standard error: 0.2854 on 9 degrees of freedom**

**Multiple R-squared: 0.9947,**	**Adjusted R-squared: 0.9936**

**F-statistic: 851.9 on 2 and 9 DF, p-value: 5.525e-11**



Below underlined, are coefficients (b1 and b2).



​	**Coefficients:**

​							**Estimate** 	**Std. Error** 	**t value** 		**Pr(>|t|)**  

**(Intercept)** 	  **56.55333**  	**0.37933** 		**149.088** 	**< 2e-16 \**\***

<u>**age**</u>     				<u>**0.97500**</u>  	  **0.02746** 		**35.504** 		**5.52e-11 \**\***

<u>**no_siblings**</u> 	  <u>**0.04071**</u>  	  **0.05551**  		**0.733**  		**0.482**



These coefficients can be interpreted as: 

*We see that the average predicted height increases by 0.975 cm for every month the child has. In the same way, height increases by 0.04071 cm for each increase in the number of siblings.*



Let’s look at the p-value of these coefficients (marked in green). If the p-value for a predictor is less than 0.05, it means that the predictors are meaningful for the model.



**Coefficients:**      	

​							**Estimate** 	**Std. Error** 	**t value** 		**Pr(>|t|)**  

**(Intercept)** 	  **56.55333**  	**0.37933** 		**149.088** 	**< 2e-16 \**\***

**age**     				**0.97500**  	  **0.02746** 		**35.504** 		**5.52e-11 \**\***

**no_siblings** 	  **0.04071**  	  **0.05551**  		**0.733**  		**0.482**   

**---*****Signif. codes: 0 ‘\*****\****’ 0.001 ‘\**’ 0.01 ‘\*’ 0.05 ‘.’ 0.1 ‘ ’ 1**



Thus, age is an excellent addition to this model but number of siblings is not. p-value of 0.482 means that there’s a 48.2% chance that this predictor is not meaningful for the regression.



**1d. Residuals**

A good way to test the quality of the fit of the model is to look at the residuals, i.e., the differences between the real values and the predicted values. We generally want the residuals to be as low as possible. 



**Residuals:**   

**Min    1Q  Median    3Q   Max** 

**-0.37548 -0.15833 0.01667 0.11452 0.50881** 



**1e. Coefficient of determination (R²)**

R² is a useful test to check the fit of the linear model. For good models R² is near 1, and models that poorly fit the data have R² near 0.



R² = (Explained Variation of the model) / (Total variation of the model)



In 1st example, R²=0.9947 (~ 1). Thus, model explains more than 99% of total variability.



**Multiple R-squared: 0.9944,**	**Adjusted R-squared: 0.9939**



**![img](https://lh3.googleusercontent.com/TDkA6x_5j43DrifVqZgqrLGPtseTYXQoE1CA52Eid7KV1eRSXFYgDcRr6tg5kI5IMGhKsnGj2UX2UkohIDF2yozUqUw125_ndr5KnavPNMlEpYW8XUYj9LCwFkM7t6N3zD2j1yGz)



Adjusted R² is a better indicator of fitness when adding more than one variable to the model, since it only increases if it reduces the overall error of the predictions.



Always remember to take a look at the residuals. So, let’s plot the first example again:

`plot(data_reg$age, data_reg$height, ylab='height', xlab='age', pch = 16, col = "blue")`

`lmHeight = lm(height~age, data = data_reg)`

`abline(lmHeight)`



**![img](https://lh6.googleusercontent.com/D_Xjee5120pHvoRYYpYCFtR4D-tVSmp0htvr58J3aEFrt9TscXFG8aLOW1sTd9er8IGVI4pC98_uP0brqJytsIJFyN08bYZ-1b6b4TWZnrr5bg0KMQjcmFRWI6MU2TPL9T97gDSn)**



Now, let’s plot its residuals:

​	`plot(lmHeight$residuals, ylab='Residuals')`



![img](https://lh5.googleusercontent.com/4pOWcAmkFL-iBQYQADMG5iYPPuDitSV1RK2N8-YJBCE4ZzsIrO7Xe02jqMOWAyBULdAp8Y3oVuCNwuBMKK0xrDKgivQaZHWSbFmGewg4VJsT6InD7j4m5Hd5RFNtoFMHl7DLNORc)



You will observe that this residuals plot looks quite random and this is what we always want. If there is a pattern, transform the variables and perform the regression again.



#### **2. Clustering in R**



**2a. What is clustering?**

Clustering groups a set of data points into clusters where the entities within a cluster are very similar and are dissimilar from entities in other clusters. Here, we will focus on Principal component analysis and the agglomerative clustering approach.



**2b. Pre-processing data**	

<u>Scaling</u>: All observations' feature values are represented as coordinates in n-dimensional space to calculate the distances between them. It is important to normalize these coordinates otherwise it may lead to false results. There are many ways to normalize: 

(i). Use normalize() function in R:standardizing the entire scale of all the feature values (x(i)) between [0,1] by applying the following transformation:
**standardize <- function(x) {(x - min(x)) / (max(x) - min(x))}**

(ii). Use scale() function in R: Via following transformation (where sd(x) is standard deviation of the feature values)
**standardize <- function(x) {(x - mean(x)) / sd(x)}**



<u>Missing Value imputation</u>: The missing/null/inf values should also be removed from the dataset before clustering is performed. Either remove them or impute them with mean, median, mode, or use some advanced regression techniques. You can use the impute() function in R.



**2c. Principal Component Analysis (PCA)**	



PCA, is a dimensionality-reduction method for large data sets that works by transforming a large set of variables into a smaller one that still contains most of the information from the large set. It allows us to see the overall "shape" of the data, identifying similar and dissimilar samples to form groups.

Let's have a look at its working before we apply it:

- Standardize the data (Center and scale).
- Calculate the Eigenvectors and Eigenvalues from the covariance matrix or correlation matrix (One could also use Singular Vector Decomposition).
- Sort the Eigenvalues in descending order and choose the K largest Eigenvectors (Where K is the desired number of dimensions of the new feature subspace k ≤ d).
- Construct the projection matrix W from the selected K Eigenvectors.
- Transform the original dataset X via W to obtain a K-dimensional feature subspace Y.



Many times PCA is followed by hierarchical clustering in analyses.



Let’s perform some PCA:

For this let’s use the mtcars dataset which is built into R. This dataset consists of data on 32 models of car. For each car, there are 11 features:

1. mpg: Fuel consumption
2. cyl: Number of cylinders
3. disp: Displacement
4. hp: Gross horsepower
5. drat: Rear axle ratio
6. wt: Weight
7. qsec: 1/4 mile time
8. vs: Engine block
9. am: Transmission
10. gear: Number of forward gears
11. carb: Number of carburetors



`mtcars.pca <- prcomp(mtcars[,c(1:7,10,11)], center = TRUE,scale. = TRUE)`

`summary(mtcars.pca)`



**Importance of components:**

​             										**PC1**  		**PC2**   	**PC3**   	**PC4**

**Standard deviation**   			**2.3782** 	**1.4429** 	**0.71008** 	**0.51481**

**Proportion of Variance** 		**0.6284** 	**0.2313** 	**0.05602** 	**0.02945**

**Cumulative Proportion** 		**0.6284** 	**0.8598** 	**0.91581** 	**0.94525**
              										**PC5**   	**PC6**   	**PC7**  		**PC8**

**Standard deviation**   			**0.42797** 	**0.35184** 	**0.32413** 	**0.2419**

**Proportion of Variance** 		**0.02035** 	**0.01375** 	**0.01167** 	**0.0065**

**Cumulative Proportion** 		**0.96560** 	**0.97936** 	**0.99103** 	**0.9975**
              										**PC9**

**Standard deviation**   			**0.14896**

**Proportion of Variance** 		**0.00247**

**Cumulative Proportion** 		**1.00000**



`str(mtcars.pca)`



**List of 5** 

**$ sdev  : num [1:9] 2.378 1.443 0.71 0.515 0.428 ...

 **$ rotation: num [1:9, 1:9] -0.393 0.403 0.397 0.367 -0.312 ...** 

**..- attr(\*, "dimnames")=List of 2** **.. **

**..$ : chr [1:9] "mpg" "cyl" "disp" "hp" ...** **.. **

**..$ : chr [1:9] "PC1" "PC2" "PC3" "PC4" ...** 

**$ center : Named num [1:9] 20.09 6.19 230.72 146.69 3.6 ...** 

**..- attr(\*, "names")= chr [1:9] "mpg" "cyl" "disp" "hp" ...**

 **$ scale  : Named num [1:9] 6.027 1.786 123.939 68.563 0.535 ...** 

**..- attr(\*, "names")= chr [1:9] "mpg" "cyl" "disp" "hp" ...** 

**$ x    : num [1:32, 1:9] -0.664 -0.637 -2.3 -0.215 1.587 ...** 

**..- attr(\*, "dimnames")=List of 2** **.. **

**..$ : chr [1:32] "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...** **.. **

**..$ : chr [1:9] "PC1" "PC2" "PC3" "PC4" ...** 

**- attr(\*, "class")= chr "prcomp"**



`install.packages("devtools")`

`library(devtools)`

`install.packages("remotes")`

`remotes::install_github("vqv/ggbiplot")`

`library(ggbiplot)`

`ggbiplot(mtcars.pca)`



![img](https://lh6.googleusercontent.com/z8l3KeHmOk5h7ZvyhomXhWBu-h3iDqrrR8Hj4iRNiBGJO9eyJbZbi_tOhm0axNNedyjrrVxTXwz4pzVvjyF18O3o4mKm4aS7wBAzg4-oH_W0F40FDQ6QsozHUid5TuH_izZrDYWy)



In this plot, you will see the axes originating as arrows from the center. The variables carb, hp, cyl, disp, wt contribute to PC1, with higher values in those variables moving the samples to the right on this plot. This lets you see how the data points relate to the axes, but it's not very informative without knowing which point corresponds to which sample (car).



Now plot PC3 and PC4 using:

`ggbiplot(mtcars.pca,choices=c(3,4))`



To know which car corresponds to which point in the plot and how they cluster, execute the following:

`ggbiplot(mtcars.pca, labels=rownames(mtcars))`



Let’s categorize these cars into US, Japanese and European:

`mtcars.country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3), "Europe", rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))`

`ggbiplot(mtcars.pca,ellipse=TRUE, labels=rownames(mtcars), groups=mtcars.country)`



![img](https://lh5.googleusercontent.com/uwU-7VyznXGAGqdgYKPPJpuF0K9KN5yqNTsLa6u9KMhBRkdX5O-CeaG8ipE9IdmzvmjOzQEJaYUE1Z22bT8iWo-ZFfaZZPBtUOwl7udFKnAMQmIoPx8maDTv_3X-Ab5uxGGrpXF1)



We see that American cars form a separate cluster in the right and they are characterized by high cyl, disp, hp, and wt. Japanese cars are clearly clustered separately and are characterized by high mpg. European cars (surrounded by the red circle) are less tightly clustered than either groups.



**2d. Hierarchical Clustering algorithm**	

Hierarchical clustering is an algorithm that groups similar objects into groups called clusters. We start with each data point as its own cluster and then combine clusters based on a similarity measure until the stopping criterion is satisfied.The endpoint is a set of clusters, where each cluster is distinct from each other cluster, and the objects within each cluster are broadly similar to each other. 



The similarity between the clusters is often calculated from the dissimilarity measures like the euclidean distance between two clusters. So the larger the distance between clusters, the better it is. For a dataset with continuous numerical values, Euclidean distance is used to calculate similarity. If the data is categorical, we Jaccard distance is used.



Let's have a look at its working before we apply it:

- Starts by calculating the distance between every pair of observation points and stores it in a distance matrix.
- Puts every point in its own cluster.
- Starts merging the closest pairs of points based on the distances from the distance matrix and as a result, the amount of clusters goes down by 1.
- Recomputes distance b/w new & old clusters and stores them in a new distance matrix.
- Repeats steps 2 and 3 until all the clusters are merged into one single cluster.



There are different Linkage methods for measuring distance between clusters: *complete linkage* (calculates the maximum distance between clusters before merging), *single linkage* (calculates the minimum distance between the clusters before merging; detects outliers), *average linkage* (calculates the average distance between clusters before merging), etc. Different linkage methods lead to different clusters and the choice depends on the users’ needs.		



Also in hierarchical clustering, the objects are categorized into a hierarchy similar to a tree-like diagram called a dendrogram. The distance of split or merge (called height) is shown on the y-axis of the dendrogram below (example figure).



![img](https://lh4.googleusercontent.com/yJMf_HW47aKm4SuC02bfk9GSuVHWvppditEY0cbHFFwdQtsc62OGBelmAxeLZdvoZUwbcRK2M-8-rTv66Kn-bo3KmoB7zapGPhOWnikghulsc0DGnxKvteQKFMPNda36aw9wbRBD)



Dunn's index is the ratio between minimum inter-cluster distances to maximum intra-cluster diameter. Diameter of a cluster is the distance between its two furthermost points. In order to have well separated & compact clusters, we must aim for a higher Dunn's index.



Let’s perform some hierarchical clustering:

`set.seed(786)`

`data_seeds <- read.csv("seeds_dataset.txt" ,sep = '\t',header = FALSE)`

`feature_name <- c('area','perimeter','compactness','length.of.kernel','width.of.kernal','asymmetry.coefficient','length.of.kernel.groove','type.of.seed')`

``colnames(data_seeds) <- feature_name`



Check if everything is numerical and for any missing or NA values in the dataset:

`str(data_seeds)`



You should get:

**'data.frame':**	**210 obs. of 8 variables:** 

**$ area**          		**: num 15.3 14.9 14.3 13.8 16.1 ...** 

**$ perimeter**       		**: num 14.8 14.6 14.1 13.9 15 ...** 

**$ compactness**      	**: num 0.871 0.881 0.905 0.895 0.903 ...** 

**$ length.of.kernel**    	**: num 5.76 5.55 5.29 5.32 5.66 ...** 

**$ width.of.kernal**    	**: num 3.31 3.33 3.34 3.38 3.56 ...** 

**$ asymmetry.coefficient** 	**: num 2.22 1.02 2.7 2.26 1.35 ...** 

**$ length.of.kernel.groove**	**: num 5.22 4.96 4.83 4.8 5.17 ...** 

**$ type.of.seed**      	**: int 1 1 1 1 1 1 1 1 1 1 ...**



`any(is.na(data_seeds))`



You should get: **[1] FALSE**



Exclude the type.of.seed column from the dataset in order to do clustering.

`seeds_label <- data_seeds$type.of.seed`

`data_seeds$type.of.seed <- NULL`



Scale all the columns:

`data_seeds_norm <- as.data.frame(scale(data_seeds))`

`summary(data_seeds_norm)`



You should get:

​	   	**area      perimeter    compactness**

**Min.  :-1.4632  Min.  :-1.6458  Min.  :-2.6619**  

**1st Qu.:-0.8858  1st Qu.:-0.8494  1st Qu.:-0.5967**  

**Median :-0.1693  Median :-0.1832  Median : 0.1037**  

**Mean  : 0.0000  Mean  : 0.0000  Mean  : 0.0000**  

**3rd Qu.: 0.8446  3rd Qu.: 0.8850  3rd Qu.: 0.7100**  

**Max.  : 2.1763  Max.  : 2.0603  Max.  : 2.0018**  

**length.of.kernel width.of.kernal  asymmetry.coefficient** 

**Min.  :-1.6466  Min.  :-1.6642  Min.  :-1.95210**   

**1st Qu.:-0.8267  1st Qu.:-0.8329  1st Qu.:-0.75734**   

**Median :-0.2371  Median :-0.0572  Median :-0.06731**   

**Mean  : 0.0000  Mean  : 0.0000  Mean  : 0.00000**   

**3rd Qu.: 0.7927  3rd Qu.: 0.8026  3rd Qu.: 0.71068**   

**Max.  : 2.3619  Max.  : 2.0502  Max.  : 3.16303**   

**length.of.kernel.groove** 

**Min.  :-1.8090**     

**1st Qu.:-0.7387**     

**Median :-0.3766**     

**Mean  : 0.0000**     

**3rd Qu.: 0.9541**     

**Max.  : 2.3234**



Notice, mean of all columns is 0 & standard deviation is 1. Now build the distance matrix:

`dist_mat <- dist(data_seeds_norm, method = 'euclidean')`



Let’s build a dendrogram by plotting the hierarchical cluster object:

`hclust_avg <- hclust(dist_mat, method = 'average')`

`plot(hclust_avg)`



You should get:



![img](https://lh4.googleusercontent.com/6vemVsRCuhTSkPbMLnyBhf6cmVaXV61fICuf08gDxQbeCwhkpxs4ueSF-yqEmiZmNdrVuUpNl7PcSAItt3FvbDHcbLXf9UjHnVxrFjYtW4J39rmRCtDHigsezG3ZjoXRwpozFYU9)



Next, cut the dendrogram to create the desired number of clusters. From the dataset, we already know that there can be only 3 types of wheat, we will get three clusters.

`cut_avg <- cutree(hclust_avg, k = 3)`



But, let’s visualize it too:

`plot(hclust_avg)`

`rect.hclust(hclust_avg , k = 3, border = 2:6)`

`abline(h = 3, col = 'red')`



You should get the following plot:

**![img](https://lh3.googleusercontent.com/BV-AQBjqTRFqBHNjGYDGFaR0qOrx1HQEBsVI877Ui6fFpc8BBtpCDHxuzybUQhDCeaaghs3sSqCqUlO2tv-z1jNV5ISUUyo3o7DfxNWZa4MOFM_DM73ub9_cG7pY6o7Wh2Hrl0Pi)**



Append the cluster results obtained back in the original data frame with mutate() and count how many observations were assigned to each cluster:

`suppressPackageStartupMessages(library(dplyr))`

`data_seeds_cl <- mutate(data_seeds, cluster = cut_avg)`

`count(data_seeds_cl,cluster)`



You should get the following:

 	*cluster* 	*n**

*1*    	1 		65

*2*    	2 		75

*3*    	3 		70



We have 70 observations for each variety of wheat and this shows the number of observations assigned in each cluster.



Let’s analyze the trend between wheat's perimeter and area cluster-wise:

`suppressPackageStartupMessages(library(ggplot2))`

`ggplot(data_seeds_cl, aes(x=area, y = perimeter, color = factor(cluster))) + geom_point()`



You should get the following plot:

![img](https://lh4.googleusercontent.com/fXHSjsC4ewbKrwJOJ9WmSv6CelOGy5kdlXOpvgewu6izyWldiEc8GwOke2Vy_LfQSN4GqgVmoli6nT70nhhYpKotzm_e35AvVJpjgs_u2LPZPvA1TqcIoYR7ZXGuMZcBox15s91A)



This shows a linear relationship between perimeter and area of all the varieties of wheat.



Let’s also cross-check these clustering results using the table() function:
`table(data_seeds_cl$cluster,seeds_label)`



You should get the following:

 		seeds_label
 	
 		1 	2 	3 

1 		55 	2 	8 

2 		7 	68 	0 

3 		8 	0 	62



This will tell you if these clusters adequately represent the different types of seeds because originally we had 70 observations for each variety of wheat.



There are other clustering algorithms too such as the K-means clustering algorithm which can be run on large datasets within a reasonable time frame. The idea behind k-means clustering is based on defining clusters so that the total within-cluster variation is minimized. The standard algorithm (Hartigan-Wong algorithm) defines the total within-cluster variation as the sum of squared distances Euclidean distances between items and the corresponding centroid:

![img](https://lh5.googleusercontent.com/pFHw3y1odv6QmY5yiOIzhIYxeMD5_eu7OX4m2AsNTXJdHipaqVIi94KdGKqrY_WMUuE_WZJJUbBPpb38G0d5sLWV2urFmBxSlLc8AtUPCOTB3HTJvaOi7tLOuVMgs6_nuuISCCv7)



Each observation (xi) is assigned to a given cluster such that the sum of squares (SS) distance of the observation to their assigned cluster centers μk is a minimum.
The total within-cluster variation is calculated using:![img](https://lh3.googleusercontent.com/3NAmySwWEQ6nafhdwGtnKWsHKlKok256oiqzl_3gWL5LqtEcxZW7zyIxR92Zaz8-EHEdSLZtS-SXQJ5RMiJlKI59w3zJn5VYRFUpcdzHXEtb15clQVGUaQGCtbCm2OC_7HFTPBso)



*Do note that:* The total within-cluster sum of squares measures the compactness (i.e goodness) of the clustering and we want it to be as small as possible. 



Since, k-means is covered in the class, you can find a detailed explanation at https://www.datanovia.com/en/lessons/k-means-clustering-in-r-algorith-and-practical-examples/. 





#### **3. Classification in R**



**3a. What is R Classification?**

Classification is the process of predicting a categorical label of a data object based on its features and properties. Here, boundary conditions corresponding to a particular category are located and objects are placed into those categories.



The basic terminologies in R classification are:

- *Classifier*: algorithm that classifies input data into output categories.
- *Classification model*: model using a classifier to categorize data objects.
- *Feature*: measurable property of a data object.
- *Binary classification*: a classification with two possible output categories.
- *Multi-class classification*: a classification with 2 or more output categories.
- *Multi-label classification*: a classification where a data object can be assigned multiple labels or output classes.



**3b. Different types of Classifiers**



- *R Logistic Regression*

​	Logistic regression is an algorithm that predicts the value of a categorical variable. It finds the relationship between a dependent variable and several independent variables. Not only does the algorithm find a class for an object, but it also gives justification and reasoning for that object to be in a specific class.

![img](https://lh6.googleusercontent.com/eJ4jz7EVYaYrISxa58K6XjWp_uhWqD3mHErgFEUiZxzeAlToQ67XLPe88ojNjuhnzSu1R2jHTPo2P7zBz2Qv0wDaj7_caE-I0uvwebI3CoDgNLJaBUgT5oVqErdUTBEOjMUUalBu)



Let’s go through an example of a binary logistic regression with the ‘Smarket’ dataset within RStudio:

`install.packages("ISLR")`

`require(ISLR)`

`head(Smarket)`



​		**Year  Lag1  Lag2  Lag3  Lag4  Lag5 Volume Today Direction**

**1	2001 0.381 -0.192 -2.624 -1.055 5.010 1.1913 0.959    Up**

**2	2001 0.959 0.381 -0.192 -2.624 -1.055 1.2965 1.032    Up**

**3	2001 1.032 0.959 0.381 -0.192 -2.624 1.4112 -0.623   Down**

**4	2001 -0.623 1.032 0.959 0.381 -0.192 1.2760 0.614    Up**

**5	2001 0.614 -0.623 1.032 0.959 0.381 1.2057 0.213    Up**

**6	2001 0.213 0.614 -0.623 1.032 0.959 1.3491 1.392    Up**



There are a number of variables here but let’s use ‘Direction’ as the response variable, as that shows whether the market went up or down since the previous day.



You can look at the distribution of the data using box and whisker plots:

`par(mfrow=c(1,8))`

`for(i in 1:8) {`

 `boxplot(Smarket[,i], main=names(Smarket)[i])`

`}`![img](https://lh5.googleusercontent.com/zBvUFl_Xav5ebQHwXynbnv_4hN7ep6ZceahhQerkbU429GXXyyzE1b_EGEQQVvuZ5mAG8An3Dv8j25d2T6DgfJ3nGWHnQ_5L17ekfN2h_-HnNvtrD0XZ43c-8vNjB78GTILRA8Hb)To see if each pair of numeric variables are correlated and change together, execute:

`install.packages("corrplot")`

`library(corrplot)`

`correlations <- cor(Smarket[,1:8])`

`corrplot(correlations, method="circle")`



![img](https://lh3.googleusercontent.com/M6pxBtV0PLi8SUQN-X0vsAWCLZmoQli8SoIIRpzg7TeUduzp1VJ45Uf4vYNg24ZtbQppgmTqFomFdzbHUsZincN6riZWsjFoPkZNWba2wlc1jIAqH-EPgdoVemvOBhGfkwF3skOo)

Here, blue shows positive correlation and red shows negative. Larger dot means a larger correlation. There seems to be a light positive correlation between volume and year but none of the other variables are correlated with one another. Now plot:

`install.packages("caret")`

`library(caret)`

`x <- Smarket[,1:8]`

`y <- Smarket[,9]`

`scales <- list(x=list(relation="free"), y=list(relation="free"))`

`featurePlot(x=x, y=y, plot="density", scales=scales)`



![img](https://lh5.googleusercontent.com/0yHJrX0IUfTSgFCbwnOuBF3wgFt5ILUFMR2-I68eGNNgPIezfeZhx5qwIXXEmJu6lMhO9fm31Gg--Z8eqpSdCsWN-BcVmUAQrnt5W24YLgxvSrF1tKbdHD4TUkJo4QxWvbZhcWCI)



In this density distribution plot of each variable broken down by Direction value, you can see that the Direction values overlap for all of these variables, meaning that it's hard to predict Up or Down based on just one or two variables.



So, let’s start building our logistic regression model. We will use the glm() function with the binomial argument to make it clear that the intent is to fit a logistic regression model:

`glm.fit <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data = Smarket, family = binomial)`

`summary(glm.fit)`



**Call:**

**glm(formula = Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, family = binomial, data = Smarket)**

**Deviance Residuals:**

  	**Min   1Q Median   3Q   Max**
  	
  	**-1.446 -1.203  1.065  1.145  1.326** 

**Coefficients:**

​       **Estimate Std. Error z value Pr(>|z|)**

**(Intercept) -0.126000  0.240736 -0.523  0.601**

**Lag1    -0.073074  0.050167 -1.457  0.145**

**Lag2    -0.042301  0.050086 -0.845  0.398**

**Lag3     0.011085  0.049939  0.222  0.824**

**Lag4     0.009359  0.049974  0.187  0.851**

**Lag5     0.010313  0.049511  0.208  0.835**

**Volume    0.135441  0.158360  0.855  0.392**

**(Dispersion parameter for binomial family taken to be 1)**
**Null deviance: 1731.2 on 1249 degrees of freedom**

**Residual deviance: 1727.6 on 1243 degrees of freedom**

**AIC: 1741.6**
**Number of Fisher Scoring iterations: 3**



summary() returns the estimate, standard errors, z-score, and p-values on each of the coefficients. From the values, it looks like none of the coefficients are significant here.



Let’s look at the predictions and fitted probabilities:

`glm.probs <- predict(glm.fit,type = "response")`

`glm.probs[1:5]`



**1	2	3	4	5**

 **0.5070841	0.4814679	0.4811388	0.5152224	0.5107812**



These first 5 probabilities are very close to 50%.



Let’s predict whether the market will be up or down based on the lags and other predictors (basically classify ‘up’ or ‘down’):

`glm.pred <- ifelse(glm.probs > 0.5, "Up", "Down")`

`attach(Smarket)`

`table(glm.pred,Direction)`



​						**Direction**

**glm.pred**		**Down**	**Up**

**Down**				**145**	**141**

**Up**					**457**	**507**



`mean(glm.pred == Direction)`

​			[1] 0.5216



Instances on the diagonals of the table give the correct classification, and off the diagonals is where the mistakes are. The mean too comes to 0.5216 which means that the classification rate is 52.16%. This is not bad but not good either. For a better result, you can divide the data into a training and a test set and refit the smaller model.



To learn more, try (optional):

http://rstudio-pubs-static.s3.amazonaws.com/74431_8cbd662559f6451f9cd411545f28107f.html





- *Random Forest Classification:*

​		To install and load package:

`install.packages(“randomForest”)`

`library(randomForest)`



To set random seed to make results reproducible:

`set.seed(123)`



To separate data into testing and training sets:

`dataset <- read.table(dataset path/url)`

`chunk <- sample(nrow(dataset), x * nrow(dataset))`

`training_dataset <- dataset[chunk, ]`

`testing_dataset <- dataset[-chunk, ]`



Basic syntax to train and predict labels:

`model <- randomForest(formula, training_dataset)`

​			formula describes the predictor and response variables.

`prediction <- predict(model, newdata = testing_dataset)`



​	*To learn more, try* (optional)*:*

[https://www.r-bloggers.com/2018/01/how-to-implement-random-forests-in-r/*](https://www.r-bloggers.com/2018/01/how-to-implement-random-forests-in-r/)





- *Decision Trees*

To learn more, try (optional):

https://medium.com/swlh/learn-classification-with-decision-trees-in-r-79c18df083b5





- *Naive Bayes Classifiers*

To learn more, try (optional):

https://rpubs.com/riazakhan94/naive_bayes_classifier_e1071



- *Support Vector Machines(SVM’s)*

To learn more, try (optional):

https://www.geeksforgeeks.org/classifying-data-using-support-vector-machinessvms-in-r/





#### **Exercises** (optional):



**Regression Exercise:**
Use the ‘*Hoja3*’ sheet of the ‘*example_linear-reg_dataset1.xls*’ dataset provided to you and fit a multiple linear regression model to predict the height of children through their age and number of hours they play. Plot the residuals of this model to show if they show a pattern or are random.



**Clustering Exercise:**

- Compute hierarchical clustering for the *'data_seeds'* dataset with the ‘complete’ linkage methods and compare the results with that generated from the ‘average’ linkage method. Submit the code, results, and a small conclusion.
- Modify the code for the final mtcars PCA plot that we generated in the examples, to include a title. Also, when re-generating the plot, remove the arrows to generate a clean and annotated PCA plot.



**Classification Exercise:**
Working forward with the R logistic regression example, fit a smaller model and use Lag1, Lag2, Lag3 as the predictors (leave out all other variables). Execute the rest of the code as shown in the example. Submit the Classification rate and summary() of glm.fit for this smaller model.