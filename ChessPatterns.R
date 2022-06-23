install.packages("devtools")
devtools::install_github("devanshagr/PermutationTestSecond")

chess <- unique(read.csv('games.csv'))
colors <- c('dodgerblue2', 'seagreen3', 'gold', 'darkorange', 'firebrick2', 'darkorchid') # Assigning color scheme

# z-tests
boxplot(chess$turns ~ chess$winner, main = 'Distribution of Turns by Outcome', 
        ylab = 'Number of Turns', xlab = 'Winner/Outcome', col = colors)
# z-test 1
black <- chess[chess$winner == 'black', ]$turns
white <- chess[chess$winner == 'white', ]$turns
sd.black.white <- sqrt(sd(black)^2/length(black) + sd(white)^2/length(white))
zeta1 <- (mean(black) - mean(white))/sd.black.white
plot(x = seq(from = -10, to = 10, by = 0.1), y = dnorm(seq(from = -10, to = 10, by = 0.1), 
     mean = 0), type = 'l', xlab = 'Mean Difference', ylab = 'Probability',
     main = 'z-test for Number of Turns Difference between Black Wins and White Wins')
abline(v = zeta1, col = 'red')
p1 <- 1-pnorm(zeta1)
p1
# z-test 2
draw <- chess[chess$winner == 'draw', ]$turns
win <- chess[chess$winner == 'black' | chess$winner == 'white', ]$turns
sd.draw.win <- sqrt(sd(draw)^2/length(draw) + sd(win)^2/length(win))
zeta2 <- (mean(draw) - mean(win))/sd.draw.win
plot(x = seq(from = -20, to = 20, by = 0.1), y = dnorm(seq(from = -20, to = 20, by = 0.1), 
     mean = 0), type = 'l', xlab = 'Mean Difference', ylab = 'Probability',
     main = 'z-test for Number of Turns Difference between Draws and Matches Won')
abline(v = zeta2, col = 'blue')
p2 <- 1-pnorm(zeta2)
p2

# Permutation test
boxplot(chess$white_rating ~ chess$winner, 
        main = 'Distribution of Player White Rating by Outcome', 
        ylab = 'Player White Rating', xlab = 'Outcome', col = colors)
PermutationTestSecond::Permutation(chess[chess$winner == 'black' | chess$winner == 'white', ],
                                   'winner', 'white_rating', 10000, 'black', 'white')
