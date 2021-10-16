# Classification-Landsat-8
The code SVM.R is used for classifying Landsat 8 data using Support Vector Machines and DT.R is used for classifying the data using Decision Trees.
The steps for both the classifications are similar and are given below.

First the Landsat 8 data for delhi is downloaded for 29th March 2020.
Then the composite bands were created and a part of image was clipped using ArcGIS. Image classification was then done for the image. The model was run in R using the training dataset and clipped image. Then accuracy assessment points were calculated (25 points were taken). Stratified random was used for sampling.
All the points were then checked and confusion matrix was created.


