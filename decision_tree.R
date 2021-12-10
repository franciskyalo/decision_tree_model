
#-------------------- about project ----------------------

# in this project, i will use the iris dataset to build a decision tree
# that predicts the species

#----------------- data----------------------------

library(datasets)

data("iris")

head(iris)

#--------------- data exploration and preparation---------------

#check response variables distribution

table(iris$Species)

# check summary of the data set

summary(iris)


# -------------------------- model --------------------------


# data partition into training and testing set

set.seed(123)

split <- sample(2, nrow(iris), replace = T, prob = c(0.8,0.2))

train <- iris[split==1,]

test <- iris[split==2,]

# training our model

library(party)

tree <- ctree(Species ~.,  data=train)

tree

# to visualize tree

plot(tree)


# predict using the test data

pred <- predict(tree, test)


probs <- predict(tree, test, type="prob")

confusionmatrix <- table (pred , test$Species )

confusionmatrix

# accuracy of the model

accuracy <- sum(diag(confusionmatrix))/sum(confusionmatrix)