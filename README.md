# StyleCast

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Prodcuct-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Demo](#Demo)
6. [Progress Update](#Progress-Update)

---

## Overview

### Description
StyleCast is a travel outfit planning app that helps users decide what to pack and wear based on real-time weather at their destination. Users input a city and destination type, fetch weather via OpenWeatherMap API, and receive personalized outfit suggestions. Trips and outfits are saved locally and managed from the My Trips tab. A Profile screen is also included.

### App Evaluation

| Attribute | Description |
|-----------|-------------|
| **Category** | Travel / Fashion |
| **Mobile** | Makes use of tab navigation, API integration, local data storage, and contextual weather-based features |
| **Story** | Helps travelers plan appropriate outfits based on weather — something people actually worry about before trips |
| **Market** | Ideal for students, fashion-conscious travelers, influencers, and organized planners |
| **Habit** | Used at the start of each trip, and repeatedly for frequent travelers |
| **Scope** | MVP is clearly defined and manageable, and optional features like profile customization and outfit editing are great for expansion |

---

## Product Spec

### 1. User Stories

#### Required Must-have Stories
- User can add a new trip by entering a city and selecting a destination type
- User can fetch the current weather for the city using OpenWeatherMap API
- User receives recommended outfit suggestions based on weather
- User can save the trip and outfit recommendation locally (UserDefaults)
- User can view a list of saved trips in a TableView
- User can tap a trip in saved list to see details 

#### Optional Nice-to-have Stories
- User can swipe to delete a trip
- User can swipe to pin/unpnin a trip
- Confirmation alert after saving a trip
- Profile Screen displayes image, name, and email
---

### 2. Screen Archetypes

- **Trip List Screen**
  - User can view all saved trips with location, destination type, weather, and outfit details
  - Delete/pin using swipe actions
  - Tap to view details 

- **Add Trip Screen**
  - User can enter a city and select destination type using segmented control
  - "Get Outfit" button trigger weather + outfit logic 

- **Weather & Outfit Suggestion Screen**
  - User can view weather forecast and receive tailored outfit ideas
  - "Save Trip" button persists data to UserDefaults

- **Trip Detail Screen**
  - User can see full trip details including outfit breakdown; Location, weather, outfit, type

- **User Profile Screen**
  - User can view/edit their profile info (name, email), saved using UserDefaults

---

### 3. Navigation

#### Tab Navigation (Tab to Screen)
- **My Trips** → Trip List Screen  
- **Add Trip** → Add Trip Screen + Suggestion Screen
- **Profile** → User Profile Screen  

#### Flow Navigation (Screen to Screen)
- **Add Trip** → Weather & Outfit Suggestion Screen → Save Trip → Return to Trips
- **My Trips** → Trip Detail Screen

---
## Wireframes

### Hand-drawn Wireframes

![StyleCast Wireframe](stylecast_wireframe.png)

This wireframe shows the full navigation and feature layout of the StyleCast app. It includes:
- Tab bar navigation between My Trips, Add Trip, and Profile
- Flow between Add Trip → Outfit Suggestion → Save Trip
- Detailed trip info screen and feature checklist

---

## Schema
struct Trip: Codable {
    let city: String
    let type: String
    let weather: String
    let outfit: String
    var isPinned: Bool = false
}

---

## Networking 
- API used: OpenWeatherMap https://openweathermap.org
- Key Data Parsed: temperature, description, used to determine outfit logic
 
---  

## Demo

Watch the Week 11 Demo:
<div>
  <a href="https://www.loom.com/share/38de962ac7244ac8af96f74f85d90ef3">
    <p>StyleCast – Week 11 Demo</p>
  </a>
  <a href="https://www.loom.com/share/38de962ac7244ac8af96f74f85d90ef3">
    <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/38de962ac7244ac8af96f74f85d90ef3-with-play.gif">
  </a>
</div>

---

## Final Demo 

<div>
  <a href="https://www.loom.com/share/2a1fae003ccf4d7c877e98f038b1b427">
    <p>Watch Final Demo – StyleCast</p>
  </a>
  <a href="https://www.loom.com/share/2a1fae003ccf4d7c877e98f038b1b427">
    <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/2a1fae003ccf4d7c877e98f038b1b427-with-play.gif">
  </a>
</div>

---

## Progress Update 

### Completed
- [x] Created Xcode project with Storyboard
- [x] Wireframe images upload
- [x] Implemented Tab Bar with three screens (Trips, Add Trip, Profile)
- [x] Created TripListViewController with mock data
- [x] Connected Storyboard UI elements to Swift code
- [x] Built Add Trip UI
- [x] Integrated OpenWeatherMap API with fetch + perse logic
- [x] Created outfit suggestion logic
- [x] Created OutfitSuggestionViewController
- [x] Saved trip using UserDefaults
- [x] Displayed trip list in TableView
- [x] Added swipe to delete & pin trip
- [x] Displayed Detailed trip view
- [x] Built Profile tab with circular profile image, name, and email

### In Progress
- [ ] UI polish 
- [ ] Allow trip editing or trip date selection 



