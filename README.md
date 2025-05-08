# online_shp_int
this is a machine learning project for online shopping intent analysis. 

Reference link https://amankharwal.medium.com/20-machine-learning-projects-for-portfolio-81e3dbd167b1

100+ projects https://thecleverprogrammer.com/2020/11/15/machine-learning-projects/

# Code Documentation: Online Shoppers Intention Analysis

## Introduction

This Jupyter Notebook performs an analysis of online shoppers' purchasing intentions using a dataset named `online_shoppers_intention.csv`. The primary goal is to segment customers based on their Browse behavior and evaluate the clustering performance.

## Libraries Used

The notebook utilizes the following Python libraries:

* `numpy` (as np): For numerical operations.
* `pandas` (as pd): For data processing and CSV file I/O.
* `matplotlib.pyplot` (as plt): For creating static, interactive, and animated visualizations.
* `seaborn` (as sns): For making statistical graphics.
* `plotly` (as py): For creating interactive charts.
* `plotly.graph_objs` (as go): For graph objects in Plotly.
* `sklearn.cluster.KMeans`: For performing K-Means clustering.
* `sklearn.preprocessing.LabelEncoder`: For encoding categorical features.
* `sklearn.metrics`: For evaluating model performance (specifically `adjusted_rand_score`).
* `scikitplot` (as skplt): For plotting learning curves, ROC AUC curves, precision-recall curves, and confusion matrices.

## Data Loading and Initial Exploration

1. **Downloading the dataset**: This is a markdown cell indicating the start of the data loading process.
2. The code then imports the necessary libraries.
3. The dataset `online_shoppers_intention.csv` is loaded into a pandas DataFrame called `data`.
4. `data.head()` is called to display the first 5 rows of the dataset, providing an initial look at the data structure and features. The output shows columns such as `Administrative`, `Administrative_Duration`, `Informational`, `ProductRelated_Duration`, `BounceRates`, `ExitRates`, `Month`, `VisitorType`, `Weekend`, and `Revenue`.
5. `data.info()` is called to print a concise summary of the DataFrame, including the data types of each column and the number of non-null values. This output confirms that there are 12330 entries and 18 columns, with varying data types (int64, float64, object, bool) and no immediate missing values indicated by "non-null count".

## Data Preparation

1. The code selects specific columns for clustering:
    * `x`: Data from columns at index 5 (`ProductRelated_Duration`) and 6 (`BounceRates`) are selected as features for clustering.
    * `y`: Data from the column at index 17 (`Revenue`) is selected as the true label for evaluation purposes.
2. The shapes of `x` and `y` are checked. `x.shape` output is `(12330, 2)`, indicating 12330 samples and 2 features.

## KMeans Clustering Analysis

### 1. Applying the KMeans library - The Elbow Method

To determine an appropriate number of clusters for the K-Means algorithm, the Elbow Method is employed.

* The Within-Cluster Sum of Squares (WCSS) is calculated for a range of cluster numbers (1 to 10).
* The K-Means algorithm is configured with `init='k-means++'`, `max_iter=300`, `n_init=10`, `random_state=0`, `algorithm='full'`, and `tol=0.001`.
* A plot of WCSS against the number of clusters is generated.

**Chart: The Elbow Method**

* **Description**: This line graph plots the WCSS (y-axis) against the Number of Clusters (x-axis, ranging from 1 to 10). The "elbow" point on the graph suggests an optimal number of clusters where adding more clusters does not significantly reduce WCSS. Based on the typical shape of an elbow method plot, the elbow appears around 2 or 3 clusters.
* **Image**:

    <!-- ```
    ![Elbow Method Plot](https://storage.googleapis.com/generativeai-downloads/images/d86d7094.png)
    ``` -->

### 2. Cluster Visualization

The data is then clustered into 3 groups using K-Means with the same parameters as above.

* The cluster labels for each data point are stored in the `labels` variable.
* The coordinates of the cluster centers (centroids) are printed.
* A scatter plot is generated to visualize the clusters.

**Chart: Clusters of Customers**

* **Description**: This scatter plot displays the customer data points based on two features (Feature 1 and Feature 2, which correspond to 'ProductRelated_Duration' and 'BounceRates' respectively).
  * Data points belonging to Cluster 1 are shown in red.
  * Data points belonging to Cluster 2 are shown in blue.
  * Data points belonging to Cluster 3 are shown in green.
  * The centroids of these clusters are marked in yellow.
    The plot helps visualize the separation and grouping of customers based on the selected features.
* **Image**:

    <!-- ```
    ![Customer Clusters Plot](https://storage.googleapis.com/generativeai-downloads/images/0dffff46.png)
    ``` -->

## Model Evaluation

The performance of the clustering is evaluated by comparing the predicted cluster labels (`labels_pred`) with the true labels (`labels_true`, derived from the 'Revenue' column).

### 1. Adjusted Rand Index

* The 'Revenue' column is label encoded to get `labels_true`.
* The `adjusted_rand_score` is calculated between `labels_true` and the K-Means predicted `labels_pred`.
* The **Adjusted Rand Index** is printed as **0.0948176535005145**. This value indicates the similarity between the true and predicted clusterings, adjusted for chance. A score close to 0 suggests random labeling.

### 2. Confusion Matrix

Confusion matrices are plotted to visualize the performance of the clustering against the true 'Revenue' labels.

* The `scikit-plot` library is installed and imported for plotting the confusion matrices.

**Chart: Confusion Matrix (Non-Normalized)**

* **Description**: This confusion matrix shows the raw counts of true labels versus predicted cluster labels. The x-axis represents the Predicted Label (clusters 0, 1, 2) and the y-axis represents the True Label (likely 0 for no revenue and 1 for revenue, based on the 'Revenue' boolean column).
  * It visualizes how many instances of actual 'Revenue' (True Label 1) were assigned to each cluster and how many instances of no 'Revenue' (True Label 0) were assigned to each cluster.
* **Image**:

    ```
    ![Confusion Matrix Non-Normalized](https://storage.googleapis.com/generativeai-downloads/images/919ed317.png)
    ```

**Chart: Confusion Matrix (Normalized)**

* **Description**: This confusion matrix shows the proportions (normalized values) of true labels versus predicted cluster labels. The axes are the same as the non-normalized version.
  * Normalization helps in understanding the accuracy of predictions for each true class, irrespective of class imbalance.
* **Image**:

    ```
    ![Confusion Matrix Normalized](https://storage.googleapis.com/generativeai-downloads/images/da0d9c8e.png)
    ```

## Conclusion

The notebook successfully loads and preprocesses the online shoppers' intention dataset. It applies the K-Means clustering algorithm, determines an optimal number of clusters using the Elbow Method (suggesting 2 or 3), and visualizes these clusters. The evaluation using the Adjusted Rand Index and confusion matrices provides insights into how well the identified clusters align with actual customer revenue generation. The relatively low Adjusted Rand Index suggests that the clusters based on 'ProductRelated_Duration' and 'BounceRates' alone may not perfectly align with the 'Revenue' outcome.
