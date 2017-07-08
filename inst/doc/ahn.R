## ----Example 1 Training--------------------------------------------------
library(ahnr)

# Create data
set.seed(12321)
x <- 2 * runif(1000) - 1;
x <- sort(x)

y <- (x < 0.1) * (0.05 * runif(100) + atan(pi*x)) + 
    (x >= 0.1 & x < 0.6) * (0.05 * runif(1000) + sin(pi*x)) + 
    (x >= 0.6) * (0.05 * runif(1000) + cos(pi*x))

plot(x, y, type = 'l')

# Create the Sigma dataset
Sigma <- list(X = data.frame(x = x), Y = data.frame(y = y))

# Create network
ahn <- AHNnD(Sigma, 5, 0.01, 500)

## ----Example 1 Simulation------------------------------------------------
# Create test data
X <- data.frame(x = x)

# Simulate
ysim <- SimAHNnD(ahn, X)

plot(x, y, type = 'l')
lines(x, ysim, type = 'l', col = 'red')

## ----Example 1 Summary---------------------------------------------------
summary(ahn)

## ----Example 1 Network Visualization-------------------------------------
plot(ahn)

## ----Example 2 Training and Simulation-----------------------------------
# Create data
t <- seq(0, 15, 0.01)
X <- data.frame(x1 = cos(t), x2 = t)
Y <- data.frame(y = sin(t))

# Create the Sigma dataset
Sigma <- list(X = X, Y = Y)

# Create network
ahn <- AHNnD(Sigma, 5, 0.01, 500)

# Simulate
ysim <- SimAHNnD(ahn, X)

plot(seq_along(Y$y), Y$y, type = 'l', col = 'black')
lines(seq_along(ysim), ysim, col = 'red')

## ----Example 2 Summary---------------------------------------------------
summary(ahn)

## ----Example 2 Network Visualization-------------------------------------
plot(ahn)

