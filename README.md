# HVC-Aug
This repository encloses some general functions implementation used in the Efficient Data Augmentation for Machine Learning Classifiers Using Horizontal and Vertical Contractions

**Dataset used in Experimentation**

Three real-world datasets have been used to evaluate the effectivenss of the proposed HVC-Aug.

**1-Adult**

This is the reasonable size dataset encompassing the diverse information of US individuals. It has been widely used by database and privacy community for experimentation purposes. Further details about this dataset can be learned from  https://ieeexplore.ieee.org/document/10214234

**2- Stroke Prediction Dataset**

This data set has been widely used in machine learning, particularly, imbalanced learning problem. This dataset has been widely used in many AI competition due to higher imbalance. Further details about this dataset can be learned from  https://ieeexplore.ieee.org/document/10214234

**3- Census Income**

This is the largest dataset encompassing the diverse information of individuals. It has been widely used by database and privacy community for experimentation purposes. Further details about this dataset can be learned from https://ieeexplore.ieee.org/document/10197160


**Baseline**

We bechmark our technique against two concepts that are prevalent in the AI community. First is to add records for all classes rather than minor or super minor (https://ieeexplore.ieee.org/document/9882118) only, and second is to exactly balance the majority and minority classes (https://ieeexplore.ieee.org/document/10214234) without exploring any possiblities of optimization. In our previous work, we only explore oppurtunities to reduce the # of records to be added while this work explore oppurtunities to add new records under salient features only, making it well suited to larger and complex datasets. 

**Implementation process**

The results can be reproduced by applying the following step by step process.

Data pre-processing : This step requires data cleaning which can be done by using buitin-package support. In most datasets, there are few quality problems such as NAs, missing values, outliers, redundant records, etc. This work exploits benefits of many built-in R packages to pre-process dataset.

Horizontal Contraction

Vertical Contraction

Noise Removal

Classiiers Building
