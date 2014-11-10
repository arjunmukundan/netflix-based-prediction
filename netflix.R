movies = read.table("movieLens.txt", header=FALSE, sep="|",quote="\"")
str(movies)
colnames(movies) = c("ID", "Title", "ReleaseDate", "VideoReleaseDate", 
                     "IMDB", "Unknown", "Action", "Adventure", "Animation", 
                     "Childrens", "Comedy", "Crime", "Documentary", "Drama", 
                     "Fantasy", "FilmNoir", "Horror", "Musical", "Mystery", 
                     "Romance", "SciFi", "Thriller", "War", "Western")
str(movies)
 
# Remove unnecessary variables
 
movies$ID = NULL
movies$ReleaseDate = NULL
movies$VideoReleaseDate = NULL
movies$IMDB = NULL
movies = unique(movies)
 
distances = dist(movies[2:20], method = "euclidean")
clusterMovies = hclust(distances, method = "ward") 
plot(clusterMovies)
clusterGroups = cutree(clusterMovies, k = 10)
 
#Computing % of movies in each
 
tapply(movies$Action, clusterGroups, mean)
tapply(movies$Romance, clusterGroups, mean)
 
# Find which cluster Men in Black is in.
 
subset(movies, Title=="Men in Black (1997)")
clusterGroups[257]
 
#Creating cluster 2 movies data set
 
cluster2 = subset(movies, clusterGroups==2)
cluster2$Title[1:10]
