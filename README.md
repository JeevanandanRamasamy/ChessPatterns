# Are there any Patterns in Chess Match Results?


## Background

As a data enthusiast, I am fascinated by the application of Data Science to gain insight about the world. I also enjoy playing Chess during my free time. In this project, I explore the results of a Chess match, from the number of turns taken to the type of victory. Does white take more turns to win? Or does black take more turns to win? How long does it take for a match to end in a draw? This data is collected from lichess.org, an online chess platform. Players in lichess.org, as with most online chess websites, are ranked based on their rating. In this project, I also test whether the ratings are accurate. In other words, does higher rating mean that the player will win another match?


## Data

The dataset I am using in this blog comes from Kaggle. The data was collected from over 20000 Chess matches in lichess.org using an API that returns information from the website. The data consists of few (not all) clusters of players in lichess.org. This dataset has variables such as number of turns, type of victory, winner, rating of player white, etc. The purpose of this dataset is to give insight into patterns commonly found across chess game results. Using these results, we can predict whether a player will win a match or not. 

Source: https://www.kaggle.com/datasnaek/chess


## How do Number of Turns affect Outcome?

<img width="317" alt="image" src="https://user-images.githubusercontent.com/94267209/175303572-00f9f25e-8298-4f71-a0e8-99618bfb2a45.png">

As you can see from this boxplot, draws generally have more turns taken than when there is a winner. Though it is not easy to tell from this graph, white has a slightly smaller mean than black for the number of turns (yes, even with that outlier of 349 turns!). In order to check if this is not a result of random chance, let’s perform a z-test.

<img width="312" alt="image" src="https://user-images.githubusercontent.com/94267209/175303599-f1a80f0a-c483-4f82-974f-c952442e5434.png">

The mean number of turns for black wins is 60.72699 and the mean number of turns for white wins is 57.75888. The p-value for this z-test is 1.522494e-10. Therefore, we can conclude that the number of turns player black takes to win is higher than the number of turns player white takes to win.

We can perform another z-test here to find if there exists a difference in the number of turns taken for victory and the number of turns taken for a draw.

<img width="332" alt="image" src="https://user-images.githubusercontent.com/94267209/175303629-0a9249d6-d831-4043-b28b-0a035a3fc489.png">

The mean number of turns for draws is 86.64815 and the mean number of turns for white wins is 59.17369. The p-value for this z-test is approximately 0. This means that matches that end in a draw have a higher mean number of turns than matches that end in a victory.


## Does Player White’s Rating affect the outcome of the match?

<img width="306" alt="image" src="https://user-images.githubusercontent.com/94267209/175303672-bd986891-5dba-419c-87d8-f20d70ab7f95.png">

As you can see from this boxplot, player white’s rating is higher when white wins than when black wins. This suggests that rating is correlated with victory, but a proper test is needed to check if this results from random chance. We will perform a permutation test to make a data-driven decision.

<img width="296" alt="image" src="https://user-images.githubusercontent.com/94267209/175303495-3266a606-1455-44ca-86a7-e0670eeac1c4.png">

The mean player white’s rating when white wins is 1633.758 and the mean player white’s rating when black wins is 1549.161. The p-value for this permutation test is 0. This means that player white does have a higher rating when white wins than when black wins.


## Conclusion

Based on these tests, we can conclude that player white is more likely to win with fewer turns taken than player black. This could mean that the longer a match takes, the more likely that player black will win. Matches that end with draws have a very large number of turns taken. Combined with the result from the first test, we can reasonably infer that player white has the best chance of winning in the beginning of the match and the result is more likely to be a loss or a draw for white as turns are taken. From the permutation test, we can conclude that the rating given to players by lichess.org is accurate, since white is more likely to win if the player has a higher rating. On the other hand, black is more likely to win if player white has a lower rating. It is important to note that this dataset does not cover all of lichess.org players. Therefore, we cannot generalize this result to the population without a simple random sample. As this data was collected using cluster sampling, the results cannot be generalized.
