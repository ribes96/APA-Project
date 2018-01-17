The amount of time needed to train all of the models is very high: in our laptop we needed about 30 minutes to run all the code. To facilitate the evaluation of the models and the code, we have saved the workspace into de file named "calculations.RData". To see the results and some of the code used to get them load calculations.RData to rstudio. You will see there are many objects defined. It follows a brief description about some of them:

- test_data.orig and test_data.rem: The datasets used to test our models
- thoraric.original and thoraric.removed: The datasets used to train our models
- xx.res.orig and xx.res.rem: The test results of the model xx. Each one is a
    list of 3 elements:
    - xx.res.orig$Score: The F2 score of the model xx
    - xx.res.orig$ConfMatrix: The confussion matrix with predicted and real values on model xx
    - xx.res.orig$SuperModel: a list containing all the models used to build the SuperModel. In our case it contains 11 sub-models
- allFalse(test_data.orig): a function that return the F2 score of a model which always says "False"
- results: a dataframe containing the results of all the models.

    In order to get the results of the model xx you need to run:
        evaluateSuperModel(xx.res.orig$SuperModel, test_data.orig)
    (You can change 'orig' by 'rem' if you want to test on that dataset)


If you want to run all the code, you need to do:
- Open rstudio
- Make sure your working directory is the one called "code"
- Modify the script named readData.R in the signaled part so that genPath contains the path to $PROJECT_DIR/dataset/ThoraricSurgery.arff
- Run the script Working_script.R
