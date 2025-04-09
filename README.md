# ios101-CapstoneProject
# StyleCast

## App Overview

StyleCast is a travel outfit planning app that helps users decide what to pack and wear based on the weather forecast for their destination. Users can input a city and destination type, view the weather, and receive curated outfit suggestions. All trip plans and outfit combos are saved locally and can be viewed or edited later.

## App Evaluation

| Criteria     | Evaluation |
|--------------|------------|
| Mobile       | Uses an API to fetch weather data, supports navigation and user-generated content. |
| Story        | Solves a real travel planning problem by helping users pack based on forecasted weather. |
| Market       | Appeals to travelers, fashion-conscious users, and organizers. |
| Habit        | Used moderately during trip planning. Reusable for each new trip. |
| Scope        | Well-contained for an MVP and offers room for optional enhancements. |

## App Spec

### Required Features (MVP)
- Add a new trip with city and destination type
- Fetch and display the weather forecast using OpenWeatherMap API
- Suggest outfit combinations based on weather
- Save trip details and outfit suggestions using UserDefaults
- Display saved trips in a UITableView

### Optional Features
- Customize outfit recommendations
- Add icons or images for outfits
- Calendar integration for trip dates
- Tabbed layout for My Trips and Recommendations

## Screens

1. Trip List Screen – Displays all saved trips using a TableView
2. Add Trip Screen – Input city and destination type
3. Weather & Outfit Suggestion Screen – Displays weather forecast and outfit ideas
4. Trip Detail Screen – Displays stored data about a selected trip

## Navigation Flow

- Flow Navigation:
  - Trip List → Trip Detail
  - Add Trip → Weather & Outfit View → Save Trip

- Optional Tab Navigation:
  - My Trips | Add Trip | Outfit Ideas

## Sprint Plan

| Sprint  | Goal                                          |
|---------|-----------------------------------------------|
| Week 1  | Setup GitHub repo and base UI layout          | x |
| Week 2  | Add Trip form UI and TableView for trips      |
| Week 3  | Integrate OpenWeatherMap API for forecast     |
| Week 4  | Add outfit suggestion logic and save data     |
| Week 5  | Polish UI, finalize features, record demo     |

## Wireframes


