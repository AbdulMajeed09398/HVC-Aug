# HVC-Aug
This repository encloses some general functions implementation used in the Efficient Data Augmentation for Machine Learning Classifiers Using Horizontal and Vertical Contractions

**Dataset used in Experimentation**

Three real-world datasets have been used to evaluate the effectiveness of the proposed HVC-Aug.

**1-Adult**

This is a reasonable-sized dataset encompassing the diverse information of US individuals. It has been widely used by the database and privacy community for experimentation purposes. This dataset in an original form is available at: http://archive.ics.uci.edu/dataset/2/adult. Further details about this dataset can be learned from  https://ieeexplore.ieee.org/document/10214234

**2- Stroke Prediction Dataset**

This data set has been widely used in machine learning, particularly, in imbalanced learning problems. This dataset has been widely used in many AI competitions due to higher imbalance. This dataset in an original form is available at: https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset.  Further details about this dataset can be learned from  https://ieeexplore.ieee.org/document/10214234

**3- Census Income**

This is the largest dataset encompassing the diverse information of individuals. It has been widely used by the database and privacy community for experimentation purposes. This dataset in an original form is available at:http://archive.ics.uci.edu/dataset/117/census+income+kdd. Further details about this dataset can be learned from https://ieeexplore.ieee.org/document/10197160


**Baseline**

We benchmark our technique against two concepts that are prevalent in the AI community. The first is to add records for all classes rather than minor or super minor (https://ieeexplore.ieee.org/document/9882118) only, and the second is to exactly balance the majority and minority classes (https://ieeexplore.ieee.org/document/10214234) without exploring any possibilities of optimization. In our previous work, we only explored opportunities to reduce the # of records to be added while this work explore opportunities to add new records under salient features only, making it well-suited to larger and more complex datasets. 

**Implementation process**

The results can be reproduced by applying the following step-by-step process.

Data pre-processing: This step requires data cleaning which can be done by using builtin-package support. In most datasets, there are few quality problems such as NAs, missing values, outliers, redundant records, etc. This work exploits the benefits of many built-in R packages to pre-process datasets.

Horizontal Contraction: In this step, we reduce the dimensionality of the data using the Boruta package. If Boruta is not installed, then first one needs to install it using the simple command `<install. packages ("Boruta")>`. If someone is using the R studio, then an option will appear for its installation. This step reduces the x-axis (# of features) of the data.

Vertical Contraction: In this step, more records are curated to compensate for the deficiency of the data. We used the CTGAN model's open-source implementation to curate more records. The requirements for installation are given in the relevant page. Any package can be installed using: pip install name of the package (e.g., `pip install scikit-learn`).  We made some changes in parametrs and modules to tailor the implementation to our goals. With the help of this step, we augmented the minority class only of real data with as limited # of samples as possible while keeping the majority fixed.

Noise Removal: Once synthetic data is added, there is a possibility of noise as discussed in our previous research. To remove noise, we used the k-means integrated method to remove noisy samples from the data. This process removes minority samples from the majority ones to improve the learning process of classifiers.

Classifiers Building: In the final step, classifiers are trained on augmented data, and the performance is compared with baseline as well as real data. In this work, we used Random Forest Classifier and we explored the possibilities of reducing hyper-parameters to train it in a very short time (e.g., few seconds). With the help of the above-cited data refinement methods, we achieved higher accuracy than the baseline with a reduced model size.
