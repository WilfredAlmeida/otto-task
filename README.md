# Otto Gallery

This repo is the technical task for a developer position at Otto

- [Otto Gallery](#otto-gallery)
  * [Features](#features)
  * [Screens](#screens)
  * [Controllers](#controllers)
  * [Directory Structure](#directory-structure)
  * [External Packages Used](#external-packages-used)
  * [Running Locally](#running-locally)
  * [Screenshots](#screenshots)
  * [Answers to task attached questions](#answers-to-task-attached-questions)
    + [1. What would be your Ideal CI/CD Pipeline for this Application](#1)
    + [2. What other features would you introduce to this app?](#2)
    + [3. How would you introduce several user types?](#3)

## Features

* The app displays photos as a gallery
* Users can tap a photo to view it in full-screen
* The image can be zoomed in and out
* The app fetches a paginated list of photos from the Unsplash API
* The gallery view has an infinite scroll, with new images fetched when the user reaches the end of the screen
* The app has implemented local image caching using CachedNetworkImage
* Users can bookmark their favorite images

## Screens

* Login Screen
* Gallery Screen
* Fullscreen image viewing screen
    

The views are separated in the forms of screens & widgets.

## Controllers

The application follows the principles of the Model-View-Controller (MVC) design pattern. Although in the current phase, models are not implemented, the architecture can be seamlessly adapted & integrated with models.

## Directory Structure

```plaintext
lib
├── controllers
│   └── photos_controller.dart
├── main.dart
└── views
    ├── screens
    │   ├── fullscreen_image.dart
    │   ├── gallery_homepage.dart
    │   └── login_screen.dart
    └── widgets
        ├── appbar.dart
        └── image_widget.dart
```

## External Packages Used

* `http`: To make HTTP requests to get images data
    
* `cached_network_image`: To locally cache images
    
* `photo_view`: To display images with additional flexibility
    

## Running Locally
1. Clone the repo
2. Execute `flutter pub get`
3. Execute `flutter run`
    
    
## Screenshots

1. Login Screen

<img src="https://cdn.hashnode.com/res/hashnode/image/upload/v1679064261844/07ca2aba-853f-49ef-a4b9-bc79b2baa1f3.jpeg" width="200" height="400">

1. Gallery Screen with bookmarked images

<img src="https://cdn.hashnode.com/res/hashnode/image/upload/v1679064654507/c6b0936b-97f2-43bb-8a76-6c526d6165f6.jpeg" width="200" height="400">
        
2. Fullscreen Image
    
<img src="https://cdn.hashnode.com/res/hashnode/image/upload/v1679064688083/35768149-51ed-4849-a511-9f2eba1352cb.jpeg" width="200" height="400">
    
3. Fullscreen zoomed image

<img src="https://cdn.hashnode.com/res/hashnode/image/upload/v1679064710329/a573273f-9b60-484f-b34d-8bf9c623bcbf.jpeg" width="200" height="400">


## Answers to task attached questions

### 1.  

> What would be your Ideal CI/CD Pipeline for this Application

Assuming that the application is in production with fresh live images being ingested every second.

Stock raw images are high quality and have bigger file sizes &gt;1MB which might be inefficient to store and transfer over the network. To address this issue, assume there is an image compression service that compresses images and stores them in primary storage. For faster delivery let's also assume the use of a CDN here. A CI/CD to make new images available to the user might look like the following

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1679069469157/4d99dd3e-67e4-43c6-a67b-4dac546feb44.png)

1. Raw high-quality & bigger file sizes images are ingested/uploaded
    
2. Images go to temporary storage or a task queue like Kafka or RabbitMQ since the compression service might be busy/unavailable/under a heavy load
    
3. The images are resized/compressed to smaller file sizes & multiple resolutions
    
4. Images along with some metadata are stored in a data store like Amazon S3
    
5. There might be an optional CDN to enable faster delivery of images
    
6. Images are visible to the client/consumer  


### 2.   

> What other features would you introduce to this app?

* Users can submit images to be displayed which might an admin/community approval to be public. This will filter potential unwanted/irrelevant/NSFW images
    
* The images a user bookmarks & opens in full-screen can be used to develop a personalized image content recommendation algorithm
    
* Bookmarked images can be cached for longer duration in mobile devices for faster access  


### 3.  

> How would you introduce several user types?

Users can be introduced by the categories of images they most interact with. Every image can have one or more categories.

Users can also be grouped by the amount of time they spend on the app.
