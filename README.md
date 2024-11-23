# Are there any Patterns in Chess Match Results?

## Background

As a data enthusiast and avid Chess player, I enjoy exploring how Data Science can provide insights into various aspects of the world, including the game of Chess. In this project, I analyze Chess match results to uncover patterns, such as the number of turns taken and the type of victory. Do white players typically take more turns to win? Does black take longer to secure a victory? How long does a match last before it ends in a draw? This data comes from lichess.org, a popular online Chess platform, where players are ranked by their ratings. I also investigate whether a player's rating accurately predicts their chances of winning.

## Data

The dataset used in this project was sourced from Kaggle, consisting of over 20,000 Chess matches from lichess.org. The data was collected using an API that fetches game information from the platform. It includes variables such as the number of turns, victory type, winner, and player ratings for the white player. The dataset is a subset of the larger cluster of players on lichess.org, and it aims to reveal patterns common across Chess game results. With this data, I aim to predict the outcome of a match based on various game characteristics.

Source: [Kaggle Chess Dataset](https://www.kaggle.com/datasnaek/chess)

## How do Number of Turns Affect Outcome?

![Boxplot showing number of turns for different outcomes](https://user-images.githubusercontent.com/94267209/175303572-00f9f25e-8298-4f71-a0e8-99618bfb2a45.png)

From the boxplot above, it is evident that matches ending in a draw generally take more turns than those with a winner. Interestingly, while it is subtle, white players tend to have a slightly smaller mean number of turns than black players (despite the outlier of 349 turns!). To ensure this observation is statistically significant, we perform a z-test.

![Z-test for white vs black turns](https://user-images.githubusercontent.com/94267209/175303599-f1a80f0a-c483-4f82-974f-c952442e5434.png)

The mean number of turns for black wins is 60.73, while for white wins, it is 57.76. The p-value for the z-test is 1.522494e-10, which allows us to conclude that the number of turns for black players is significantly higher than for white players.

Additionally, we compare the number of turns taken for a victory versus a draw:

![Z-test for victory vs draw turns](https://user-images.githubusercontent.com/94267209/175303629-0a9249d6-d831-4043-b28b-0a035a3fc489.png)

The mean number of turns for draws is 86.65, while for white wins, it is 59.17. With a p-value close to 0, we can conclude that matches resulting in a draw take more turns than those with a winner.

## Does Player White’s Rating Affect the Outcome of the Match?

![Boxplot showing player white's rating for different outcomes](https://user-images.githubusercontent.com/94267209/175303672-bd986891-5dba-419c-87d8-f20d70ab7f95.png)

The boxplot reveals that player white's rating is generally higher when white wins compared to when black wins. This suggests that rating might influence the outcome. To confirm, we conduct a permutation test.

![Permutation test for white player's rating](https://user-images.githubusercontent.com/94267209/175303495-3266a606-1455-44ca-86a7-e0670eeac1c4.png)

The mean rating for player white when they win is 1633.76, while when black wins, it is 1549.16. With a p-value of 0, we can conclusively state that player white's rating has a significant impact on their chances of winning.

## Conclusion

Based on the results of the tests, we can conclude that:

- Player white is more likely to win in fewer turns than player black. Longer matches are more likely to result in a black win.
- Matches that end in a draw tend to have significantly more turns than those with a winner.
- Player white's rating is a good predictor of match outcomes, as higher ratings correlate with a higher probability of white winning.

However, it is important to note that this dataset represents only a subset of lichess.org players and was collected using cluster sampling. Therefore, the findings cannot be generalized to the entire population of players on the platform. For more robust insights, further data collection through random sampling would be needed.
