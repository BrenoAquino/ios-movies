# Home

<img src="/images/home.png" width="400" align="left">

#### Feature
The app's Home features an upcoming carousel that has the infinity behavior and the autoscroll behavior every 5 seconds. A carousel is also shown for each film genre returned by TheMovieDB.

#### Technical Point
For the app to be able to set up the home, about 22 requests are made (depending on the number of genres).

A request is made to obtain all genres. After the result, all other requests (one for gender + one for upcoming) are triggered, in parallel.

#### Improvement (WIP)
Create an intelligent and automatic way to control the carousel pagination. There is still no paging control in any part of the app.

#### APIs
- Genres: <https://developers.themoviedb.org/3/genres/get-movie-list>
- Movies by Gender: <https://developers.themoviedb.org/3/discover/movie-discover>
- Upcoming: <https://developers.themoviedb.org/3/movies/get-upcoming>
