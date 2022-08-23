# BMEG 310 Assignment 2 Answer Key

**TOTAL:** Out of 42, plus 1 bonus

**Note 1:** Errors were not carried forward wherever a mistake was repeated. If an explanation was based off incorrect results but was thorough and made sense in terms of the models, data, and found results, it was given at least part marks.<br/>
**Note 2:** If your answer does not match the one given below, this does not mean it is incorrect. If you lost marks for an explanation, it means that your statements were incorrect given your results or you were missing something important.<br/>
**Note 3:** Submissions were marked late according to the following rules: 10% (4 marks) taken off for each day late up to 3 days, and then zero for assignment. This means that if you were between 0 and 1 day late, 10%, between 1 and 2 days, 20% etc.<br/>

## Question 1
**Q1.1. (3 marks)** *1 mark for code, 1 mark for data selection, 1 mark for correct answer*<br/>
Code:
```
pca <- prcomp(~ . - diagnosis - cell_id, data=ovarian.dataset, scale=TRUE, center=TRUE)
summary(pca)
```
Answer:
<br/>
0.4277

**Q1.2. (2 marks)** *1 mark for identifying cumulative proportion > 0.9, 1 mark for correct answer*<br/>
Answer:<br/>
9 PCs (cumulative = 0.90101)


**Q1.3. (2 marks)** *1 mark for code, 1 mark for plot (minus 1 for color, minus 1 for data)*<br/>
Code:
```
library(ggplot2)
pca_data <- as.data.frame(pca$x)
ggplot(pca_data, aes(x=PC1, y=PC2)) + geom_point(aes(colour=factor(ovarian.dataset$diagnosis)))
```


**Q1.4. (2 marks)** *1 mark for code, 1 mark for plot (minus 1 for color, minus 1 for data)*<br/>
Code:
```
library(ggplot2)
ggplot(ovarian.dataset, aes(x=area, y=concavity)) + geom_point(aes(colour=factor(diagnosis)))
```

**Q1.5. (2 marks)** *1 mark for observation, 1 mark for explanation*<br/>
Answer:<br/>
Yes, plot in 1.3 has much less overlap than that in 1.4, indicating higher separability. This is because the first two PCs capture greater variance in the data (and in this case, that variance is correlated with diagnosis)


**Q1.6. (1 mark)** *0.5 mark for code, 0.5 mark for plot*<br/>
Code:
```
boxplot(pca_data)
```

## Question 2
**Q2.1. (5 marks)** *1 mark for kmeans, 1 mark for data selection, 1 mark for cluster id, 1 mark for correct confusion matrix, 1 mark for correct concordance (minus 1 mark if no confusion matrix)*<br/>
Code:
```
scaled.data <- scale(ovarian.dataset[c(3:32)])
kmean <- kmeans(scaled.data, 2)
result <- ifelse(kmean$cluster == 1, "M", "B")
table(result, ovarian.dataset$diagnosis)
```
Answer:<br/>
371    35<br/>
14  	205<br/>
Accuracy = (371+205)/(371+205+14+35)=92.16<br/>
Precision =(205)/(205+14) or (371/371+35)<br/>
Recall =(205)/(205+35) or (371)/(371+14)<br/>

**Q2.2. (3 marks)** *1 mark for code, 1 mark for mean accuracy, 1 mark for explanation*<br/>
Code:<br/>
Any method which averages 10 *different* runs and calculates mean accuracy (could be hand calculated)<br/>
Answer:<br/>
Accuracy around 0.92<br/>
Fluctuates because kmeans output depends on a random initial seed which varies each run (and there are multiple solutions which kmeans can arrive at)<br/>


**Q2.3. (2 marks)** *1 mark for correct data selection, 1 mark for result*<br/>
Code:
```
new_data <- pca_data[c(1:5)]
kmean <- kmeans(new_data, 2)
result <- ifelse(kmean$cluster == 1, "M", "B")
conf_mat <- table(result, ovarian.dataset$diagnosis)
```
Result:<br/>
Answer should nearly match that of 2.2.


**Q2.4. (2 marks)** *1 mark for observation, 1 mark for explanation*<br/>
Answer:<br/>
Results are nearly identical. This occurs because the first 5 PCs capture most of the variance of the dataset and thus separate the data into clusters in the same way as the original data


## Question 3
**Q3.1. (6 marks)** *1 mark for glm, 1 mark for data selection, 1 mark for class id, 1 mark for correct confusion matrix, 1 mark for acc, spec, sens, 1 mark for explanation (minus 1 mark if no confusion matrix)*<br/>
Code:
```
ovarian.dataset.train <- ovarian.dataset[sample(nrow(ovarian.dataset))[1:(nrow(ovarian.dataset)/2)],]
ovarian.dataset.test <- ovarian.dataset[sample(nrow(ovarian.dataset))[(nrow(ovarian.dataset)/2):(nrow(ovarian.dataset))],]
my_glm <- glm(as.factor(diagnosis) ~ . - cell_id, data=ovarian.dataset.train, family=binomial)
glm_pred_prob <- predict(my_glm, ovarian.dataset.test)
glm_pred <- ifelse(glm_pred_prob > 0.5, "M", "B")
table(glm_pred, ovarian.dataset.test$diagnosis)
glm_pred_prob_train <- predict(my_glm)
glm_pred_train <- ifelse(glm_pred_prob_train > 0.5, "M", "B")
table(glm_pred_train, ovarian.dataset.train$diagnosis)
```
Answer:<br/>
glm_pred   B   M
       B 180  10
       M   3 120
<br/>
glm_pred_train   B   M
             B 187   0
             M   0 125
Accuracy = (180 +120)/(180+3+10+120)<br/>
Precision = (180)/(180+10) or (120)/(120+3)<br/>
Recall = (180)/(180+3) or (120)/(120+10)<br/>

The same metrics can be calculated for the training data.

The accuracy of the train is 100%, while the accuracy of test is lower (around 96%). This occurs because the model has overfit the training data and therefore loses some accuracy when generalizing to the (new) test data.

**Q3.2. (3 marks)** *1 mark for data preparation, 1 mark for data selection, 1 mark for correct result (minus 1 mark if no confusion matrix)*<br/>
Code:
```
pca_data$diagnosis <- ovarian.dataset$diagnosis
pca.train <- pca_data[sample(nrow(pca_data))[1:(nrow(pca_data)/2)],]
pca.test <- pca_data[sample(nrow(pca_data))[(nrow(pca_data)/2):(nrow(pca_data))],]
my_glm <- glm(as.factor(diagnosis) ~ PC1 + PC2 + PC3 + PC4 + PC5, data=pca.train, family=binomial)
glm_pred_prob <- predict(my_glm, pca.test) # do not use "data=dataset.test" or the length of the output will be incorrect
glm_pred <- ifelse(glm_pred_prob > 0.5, "M", "B")
table(glm_pred, pca.test$diagnosis)
```



**Q3.3. (3 marks)** *1 mark for observation, 2 marks for explanation*<br/>
Answer:<br/>
The average accuracy of glm on PCs is higher than that for normal dataset. Glm has better testing accuracy on PCs because it is overfitting less. It overfits less because there is less noise in the data, which is a direct result of the PCs capturing only the essential variance in the data (for explanation, at least 1 marks if overfitting is mentioned or variance captured by PCA or noise in the data is mentioned)

**Q3.4. (2 marks)** *1 mark for comparing measures, 1 mark for correct observation*<br/>
Answer:<br/>
Glm has higher accuracy (around 0.96) than kmeans (around 0.92)

**Q3.5. (3 marks)** *1 mark for obtaining correct plot, 1 mark for correct separability explanation, 1 mark for correct ROC vs sens/spec explanation*<br/>
Answer:<br/>
ROC curve tells us that our model demonstrates high separability of the data due to the sharp curve/high AUROC. ROC tells us about a range of tp/tn (and hence sens/spec or precision/recall) values over different thresholds, whereas the latter is a single measure, so more information is contained in in ROC.

**Q3.6 (2 marks)** *1 mark for code, 1 mark for result, explanations*<br/>
Any correctly used model is acceptable, but it should include both the whole dataset and 5 PCAs sections with their outputs.