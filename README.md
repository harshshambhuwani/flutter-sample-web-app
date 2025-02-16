# Flutter Sample Web App
**App Link:** https://harshshambhuwani.github.io/flutter-sample-web-app/


This is a Flutter web project that demonstrates:
- **Dynamic Image Display:** Enter a URL to load an image.
- **Fullscreen Toggling:** Double-click on the image or use a floating action menu to toggle fullscreen mode.
- **State Management:** Uses [GetX](https://pub.dev/packages/get) for state management.
- **Conditional Imports:** Ensures web-specific code is only included when compiling for web.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the App Locally](#running-the-app-locally)
- [Building for Web](#building-for-web)
- [Deployment](#deployment)
  - [GitHub Pages](#github-pages)
  - [Firebase Hosting](#firebase-hosting)
  - [Netlify](#netlify)
- [Project Structure](#project-structure)
- [License](#license)

## Features

- **URL Input and Image Display:** Load and display an image from a user-provided URL using an HTML `<img>` element.
- **Fullscreen Toggle:** Toggle fullscreen mode on double-clicking the image or by using context menu buttons.
- **Floating Action Button:** A "Plus" button displays a context menu for fullscreen options, with a dimmed background when open.
- **Platform Specific Code:** Uses conditional imports to include web-specific functionality only when running on web.

## Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (with web support enabled)
- [Git](https://git-scm.com/downloads)
- A GitHub account

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/harshshambhuwani/flutter-sample-web-app.git
   cd flutter-sample-web-app
