# Overview

This project replicates an architecture for large projects in order to feel some of the problems that could arise in large projects. It serves as a base project for POCs and to try to evolve the architecture.

This repository was born with cocoapods but was migrated to the swift package. The screens were created using view code and the project was configured for the minimum version iOS 13.0.

Here screens were created using view code with a workspace of 3 projects. One project to create a communication interface with TheMovieDB APIs, another project that creates the app for iOS / iPad / MacOS and the other project is responsible for creating the app for AppleTV.

### Future and SwiftUI

This project will be fragmented into 3 other repositories. A repository will be destined to create the interface with TheMovieDB APIs, it will be made compatible with both Cocoapods and SwitfPackage. Another repository will recreate the features implemented here, but using SwiftUI. The other project will replicate the same features presented in the AppleTV app, but will also use SwiftUI.

# Architecture

<img src="/images/architecture.png">

# Home

<div style="text-align:center"> <img src="/images/home.png" width="300"></div>.

#### Feature
The app's Home features an upcoming carousel that has the infinity behavior and the autoscroll behavior every 5 seconds. A carousel is also shown for each film genre returned by TheMovieDB.

#### Technical Point
For the app to be able to set up the home, about 22 requests are made (depending on the number of genres).

A request is made to obtain all genres. After the result, all other requests (one for gender + one for upcoming) are triggered, in parallel.

#### Improvement (WIP)
Create an intelligent and automatic way to control the carousel pagination. There is still no paging control in any part of the app.

#### APIs
Genres: <https://developers.themoviedb.org/3/genres/get-movie-list>

Movies by Gender: <https://developers.themoviedb.org/3/discover/movie-discover>

Upcoming: <https://developers.themoviedb.org/3/movies/get-upcoming>

  
# Detail

<img src="/images/detail.png" width="400" align="right">

#### Feature
The movie detail feature introduces the movie's synopsis along with its title and poster image. In addition to this information, a set of recommended movies based on the current movie and a set of keywords referring to the film are shown.

#### Technical Point
The blur in navigation has a dynamic alpha depending on the tableView scroll. The blur opacity follows a linear rule to be defined.

A custom layout was created for the collectionView to follow the keyword display rule, that is, populate horizontally and skip the line if it no longer fits on the screen.

#### Improvement (WIP)
Constraint warnings in run time.

#### APIs
Detail: <https://developers.themoviedb.org/3/movies/get-movie-details>

Keywords: <https://developers.themoviedb.org/3/movies/get-movie-keywords>

Recommendations: <https://developers.themoviedb.org/3/movies/get-movie-recommendations>
