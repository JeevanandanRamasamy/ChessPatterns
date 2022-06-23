# Are there any Patterns in Chess Match Results?

## Background

As a data enthusiast, I am fascinated by the application of Data Science to gain insight about the world. I also enjoy playing Chess during my free time. In this project, I explore the results of a Chess match, from the number of turns taken to the type of victory. Does white take more turns to win? Or does black take more turns to win? How long does it take for a match to end in a draw? This data is collected from lichess.org, an online chess platform. Players in lichess.org, as with most online chess websites, are ranked based on their rating. In this project, I also test whether the ratings are accurate. In other words, does higher rating mean that the player will win another match?

## Data

The dataset I am using in this blog comes from Kaggle. The data was collected from over 20000 Chess matches in lichess.org using an API that returns information from the website. The data consists of few (not all) clusters of players in lichess.org. This dataset has variables such as number of turns, type of victory, winner, rating of player white, etc. The purpose of this dataset is to give insight into patterns commonly found across chess game results. Using these results, we can predict whether a player will win a match or not. 

Source: https://www.kaggle.com/datasnaek/chess

## How do Number of Turns affect Outcome?

![Distribution of Turns by Outcome](https://user-images.githubusercontent.com/94267209/175302163-d339d811-b363-4fa5-ab41-e91c0200a41d.png)

As you can see from this boxplot, draws generally have more turns taken than when there is a winner. Though it is not easy to tell from this graph, white has a slightly smaller mean than black for the number of turns (yes, even with that outlier of 349 turns!). In order to check if this is not a result of random chance, let’s perform a z-test.

![z-test for Number of Turns Difference between Black Wins and White Wins](https://user-images.githubusercontent.com/94267209/175302325-13b2c83b-23f4-4b86-a5ff-2834300a622f.png)

The mean number of turns for black wins is 60.72699 and the mean number of turns for white wins is 57.75888. The p-value for this z-test is 1.522494e-10. Therefore, we can conclude that the number of turns player black takes to win is higher than the number of turns player white takes to win.

We can perform another z-test here to find if there exists a difference in the number of turns taken for victory and the number of turns taken for a draw.

![z-test for Number of Turns Difference between Draws and Matches Won](https://user-images.githubusercontent.com/94267209/175302564-7ebff557-e4de-4927-86e9-d5591b792ccd.png)

The mean number of turns for draws is 86.64815 and the mean number of turns for white wins is 59.17369. The p-value for this z-test is approximately 0. This means that matches that end in a draw have a higher mean number of turns than matches that end in a victory.

## Does Player White’s Rating affect the outcome of the match?
