> README

# Image Identifier

An application for people with visual impairment to upload photos that have no alt tags in their images.

Users are able to sign in, see photos they have uploaded on their user page, see a photos index to see all images uploaded onto the app, and all the images a particular user has uploaded.

With each image upload, an image is uploaded using cloud storage, but to also passed through a Google Cloud machine learning model to generate highly accurate tags of what's in the image, and should there be a celebrity or celebrity lookalike - it will recognise them.


* Ruby on Rails - version 5.1.6

* Cloudinary Cloud Storage for the images

* SQLite3 database storage for user information

* Google Cloud Machine Learning Auto-Tagging Model
