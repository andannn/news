/// Fake topic data.
const topicsFakeData =
[
  {
    "id": "1",
    "name": "Headlines",
    "shortDescription": "News you'll definitely be interested in",
    "longDescription": "The latest events and announcements from the world of Android development.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
    "url": ""
  },
  {
    "id": "2",
    "name": "UI",
    "shortDescription": "not including Compose",
    "longDescription": "Stay up to date on Material Design, Navigation, Text, Paging, Compose, Accessibility (a11y), Internationalization (i18n), Localization (l10n), Animations, Large Screens, Widgets and much more!\n\nTo get Compose specific news, make sure you also follow the Compose topic. ",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_UI.svg?alt=media&token=0ee1842b-12e8-435f-87ba-a5bb02c47594",
    "url": ""
  },
  {
    "id": "3",
    "name": "Compose",
    "shortDescription": "",
    "longDescription": "All the latest and greatest news on Jetpack Compose - Android’s modern toolkit for building native user interfaces.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Compose.svg?alt=media&token=9f0228e8-fdf2-45ee-9fd0-7e51fda23b48",
    "url": ""
  },
  {
    "id": "4",
    "name": "Architecture",
    "shortDescription": "",
    "longDescription": "Stay up-to-date with Android architecture best practices including scalability and modularization. ",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Architecture.svg?alt=media&token=e69ed228-fa91-49ae-9017-c8b7331f4269",
    "url": ""
  },
  {
    "id": "5",
    "name": "Android Studio & Tools",
    "shortDescription": "",
    "longDescription": "The latest news on Android development tools, including Android Studio, Gradle, device emulators, debugging tools and more.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Android-Studio.svg?alt=media&token=b28b82dc-5aa1-4098-9eff-deb04636d3ac",
    "url": ""
  },
  {
    "id": "6",
    "name": "Testing",
    "shortDescription": "",
    "longDescription": "The latest news on testing, including unit and UI testing, and continuous integration.  ",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Testing.svg?alt=media&token=a11533c4-7cc8-4b11-91a3-806158ebf428",
    "url": ""
  },
  {
    "id": "7",
    "name": "Performance",
    "shortDescription": "",
    "longDescription": "Up-to-date content on optimizing your app performance, including profiling, tracing and jank avoidance.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Performance.svg?alt=media&token=558fdf02-1918-4527-b13f-323db67e31cc",
    "url": ""
  },
  {
    "id": "8",
    "name": "New APIs & Libraries",
    "shortDescription": "",
    "longDescription": "Stay up-to-date with new APIs & library releases, including Jetpack.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_New-APIs-_-Libraries.svg?alt=media&token=8efd12df-6dd9-4b1b-81fd-017a49a866ac",
    "url": ""
  },
  {
    "id": "9",
    "name": "Data Storage",
    "shortDescription": "",
    "longDescription": "Everything to do with data storage, including Room and DataStore.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Data-Storage.svg?alt=media&token=c9f78039-f371-4ce1-ba82-2c0c1e20d180",
    "url": ""
  },
  {
    "id": "10",
    "name": "Kotlin",
    "shortDescription": "",
    "longDescription": "New language features and guidance for getting the best out of Kotlin on Android. ",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Kotlin.svg?alt=media&token=bdc73380-e80d-47df-8954-d9b61cccacd2",
    "url": ""
  },
  {
    "id": "11",
    "name": "Privacy & Security",
    "shortDescription": "",
    "longDescription": "The latest news on security best practices, APIs and libraries.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Privacy-_-Security.svg?alt=media&token=6232fd17-c1cc-43b3-bf70-a734323fa6df",
    "url": ""
  },
  {
    "id": "12",
    "name": "Publishing & Distribution",
    "shortDescription": "",
    "longDescription": "Everything to do with publishing and distributing your app, including Google Play.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Publishing-_-Distribution.svg?alt=media&token=64a5aeaf-269a-479d-8a44-29f59d337dbf",
    "url": ""
  },
  {
    "id": "13",
    "name": "Platform & Releases",
    "shortDescription": "",
    "longDescription": "Stay up-to-date with the latest Android releases and features.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Platform-_-Releases.svg?alt=media&token=ff6d7a38-5205-4a51-8b6a-721e665dc515",
    "url": ""
  },
  {
    "id": "14",
    "name": "Accessibility",
    "shortDescription": "",
    "longDescription": "The latest news on accessibility features and services, helping you to improve your app's usability, particularly for users with disabilities.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Accessibility.svg?alt=media&token=5b783a03-dd3b-4d0c-9e0c-16ae8350295f",
    "url": ""
  },
  {
    "id": "15",
    "name": "Android Auto",
    "shortDescription": "",
    "longDescription": "The latest news on Android Automotive OS and Android Auto.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Android-Auto.svg?alt=media&token=56453754-14a5-4953-b596-66d63c56c196",
    "url": ""
  },
  {
    "id": "16",
    "name": "Android TV",
    "shortDescription": "",
    "longDescription": "Stay up-to-date on everything to do with building apps for Android TV.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Android-TV.svg?alt=media&token=a78ca0df-f1ba-44a6-a89d-3912c82ef661",
    "url": ""
  },
  {
    "id": "17",
    "name": "Games",
    "shortDescription": "",
    "longDescription": "The latest news on Android game development.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Games.svg?alt=media&token=4effa537-cc42-4d7f-b6bd-f1f14568db07",
    "url": ""
  },
  {
    "id": "18",
    "name": "Camera & Media",
    "shortDescription": "",
    "longDescription": "The latest news on capturing and playing media on Android, including the Camera and Media APIs. ",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Camera-_-Media.svg?alt=media&token=73adea20-20d4-4f4c-8f3b-eb47c1097496",
    "url": ""
  },
  {
    "id": "19",
    "name": "Wear OS",
    "shortDescription": "",
    "longDescription": "The latest news on app development for Wear OS.",
    "imageUrl": "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Wear.svg?alt=media&token=bd11fe4c-9c92-4536-8ebc-5210f44d09be",
    "url": ""
  }
];