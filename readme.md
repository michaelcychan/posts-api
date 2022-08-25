# Mock Blog Post Server

This is a tech test exercise to the [question](./question.md) here. This server receives requests from client and fetches data using an external API.  

I used Ruby on Rails also as a practice of this framework.

## User Stories

As a reader,  
so that I can read posts that interest me,  
I want to filter posts with tags  

As a reader,  
so that I can read posts that are most liked,  
I want the posts with descending number of likes  

As a reader,  
so that I can read the most popular posts,  
I want only posts more than a certain number of read to show  

As a reader,  
so that I can read posts without slowing down my machine,  
I want the posts to be shown in pages, each showing a number of posts, eg 10 posts.  

<img src="./diagram.png">

## Installation and Running the server
To install, first clone the git and install all dependencies:
```
git clone https://github.com/michaelcychan/posts-api.git
cd posts-api
gem install

bin/rails server
```
The termainal will now start the server  
  
### Features
Use your browser to open http://localhost:3000  

<img src="./posts-api-1-new.png" width=750>

If no tag parameter is given, a default tag: tech will be used. Different parameters can be added after ```http://localhost:3000/?```  

Each parameter should be separated by ```&```

```?tag=```tech, health, culture...   
posts will be filtered with tag   
   
```?minread=```
posts will be filtered with the minimum number of read

```?postCount=```
only a certain number of posts is shown, if further posts is required, add ```?page=```

Example: ```?tag=history&postCount=5&page=3```   
<img src="./posts-api-2-new.png" width=750>