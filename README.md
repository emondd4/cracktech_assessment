<h2 style="margin-bottom: 0;" align="center">Assessment</h2>

<p align="center">
<h3 style="margin-top: 0;" align="center">Assessment For Crack Tech Ltd.</h3>
</p>

<p align="start">
<h3 style="margin-top: 0;" align="start">Assessment Log (Done / Undone)</h3>
<h4 style="margin-top: 0;" align="start">✔ Implement a loading screen while fetching the data.</h4>  
<h4 style="margin-top: 0;" align="start">✔ Handle network issues and provide error feedback.</h4>
<h4 style="margin-top: 0;" align="start">✔ Create a detailed view that shows up when an item in the list is tapped.</h4> 
<h4 style="margin-top: 0;" align="start">✔ Use Bloc/GetX for state management.</h4> 
<h4 style="margin-top: 0;" align="start">❌ Use Bloc/GetX for state management.</h4>
<h4 style="margin-top: 0;" align="start">❌ Cache API responses using Flutter Hive and Bloc/GetX.</h4> 
</p>
	
## App Screenshots
<table>
  <tr>
     <td align="center">Splash Screen</td>
     <td align="center">Movie List</td>
     <td align="center">Movie Details</td>
  </tr>
  <tr>
    <td valign="top"><img src="https://github.com/emondd4/cracktech_assessment/blob/master/assets/images/splash.jpg" height="400" width="200"></td>
    <td valign="top"><img src="https://github.com/emondd4/cracktech_assessment/blob/master/assets/images/home.jpg" height="400" width="200"></td>
    <td valign="top"><img src="https://github.com/emondd4/cracktech_assessment/blob/master/assets/images/details.jpg" height="400" width="200"></td>
  </tr>
 </table>
 <br>
<table>
  <tr>
     <td align="center">Sample Video</td>
  </tr>
  <tr>
    <td valign="top"><img src="https://github.com/emondd4/cracktech_assessment/blob/master/assets/images/sample.gif" height="400" width="200"></td>
  </tr>
 </table>
 <br>

## Features

* Dio API Call
* Getx State Management
* Hive Local Storage

### Built With

* Android Studio 2022.3.1 Patch 2 The latest version can be downloaded from [here](https://developer.android.com/studio/)
* Build gradle 7.3.0
* Android SDK 33
* Kotlin Version 1.7.10

## Libraries Used
* [Dio](https://pub.dev/packages/dio)
* [Logger](https://pub.dev/packages/logger)
* [Getx](https://pub.dev/packages/get)
* [Hive](https://pub.dev/packages/hive)
* [Shared Preference](https://pub.dev/packages/shared_preferences)
* [Easy Loading](https://pub.dev/packages/flutter_easyloading)

### Install the apk

<a href="[https://github.com/emondd4/cracktech_assessment/blob/master/assets/app.apk](https://github.com/emondd4/cracktech_assessment/blob/master/assets/app.apk)"><img alt="Download Debug APK" src="https://media-blog.cdnandroid.com/wp-content/uploads/sites/3/sites/3/2015/06/apk-1.png" width="185" height="70"/></a>

Go to the following [link](https://github.com/emondd4/cracktech_assessment/blob/master/assets/app.apk) to download the app.

### Directory Structure

The following is a high level overview of relevant files and folders.

```
crack_tech_assessment
└───assets
    └───apk
    └───images
    └───lottie
    └───icons
└───lib
    └───Controller
          │   DetailsScreenController.dart
          │   HomeScreenController.dart
    └───Model
          │   MovieListBaseResponse.dart
    └───Network
          │   api_client.dart
          │   api_repository.dart
          │   api_urls.dart
    └───UI
        |   DetailsScreen.dart
        |   HomeScreen.dart
        |   SplashScreen.dart
    └───utils
        |   AppComonUtil.dart
        |   AppLoggedUtil.dart
        |   AppUiUtils.dart
        |   AppImages.dart
        |   AppRoutes.dart
    └───main
                            
```

## License
```
MIT License

Copyright (c) 2020 Easy News

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
