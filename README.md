# Summary:

Our app is a social media site designed for sharing clothing items. When user’s purchase a new item of clothing, they can model the item, and post their photos. The app asks users for their measurement data (such as weight and height). Using this data, we can recommend future users the correct size of clothing for them, based on the data we have collected from previous users.

# Components

# Frontend:
	
Our frontend is a flutter app. The frontend has multiple pages such as the explore page, a search page, a profile page, and a trending page. We also have a camera button which lets the user take a photo and submit a new post.

# Backend:

The backend provides many endpoints which the frontend uses to access and manipulate data. The backend reads and writes to the database directly. The backend handles authentication, creating posts, comments, and users. The backend also includes websockets which provide live data for the trending page

# Data Mining:

To set up our app with sample posts, data was mined from popular retail sites. We used this data to fill our app with sample users, posts, and clothing items.

# Elastic Search:

Elasticsearch is used on the search page. This lets us search posts by clothing items, users, and more.
