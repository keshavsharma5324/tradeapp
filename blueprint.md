# Blueprint

## Overview

This document outlines the project structure, design, and features of the TradeWatch application. It serves as a single source of truth for the application's development, from its initial version to the current state.

## Project Structure

The project is organized into the following directories:

- `lib/`: Contains the main application code.
  - `blocs/`: Contains the business logic components (BLoCs) for managing the application's state.
    - `market_watch_bloc/`: Contains the BLoC for managing the market watch screen's state.
  - `data/`: Contains the data sources for the application.
    - `datasources/`: Contains the data source implementations.
      - `market_data_source.dart`: Defines the abstract `MarketDataSource` and provides a mock implementation.
  - `models/`: Contains the data models for the application.
    - `market_data_model.dart`: Defines the `MarketDataModel` model.
  - `screens/`: Contains the application's screens.
    - `market_watch_screen.dart`: The main screen of the application.
  - `widgets/`: Contains the reusable widgets for the application.
    - `bottom_nav_bar.dart`: The bottom navigation bar widget.
    - `center_docked_fab.dart`: The floating action button widget.
    - `empty_state.dart`: The widget to show when there is no data.
    - `error_state.dart`: The widget to show when an error occurs.
    - `loading_state.dart`: The widget to show while data is being fetched.
    - `market_list_item.dart`: The widget for each item in the market list.
- `assets/`: Contains the application's assets.
  - `data/`: Contains the data files for the application.
    - `market_data.json`: The initial market data.
- `test/`: Contains the application's tests.

## Design

The application follows a modern, clean design with a purple and white color scheme. The UI is designed to be intuitive and easy to use.

### Theming

- **Primary Color:** Deep Purple
- **Accent Color:** White
- **Gradient:** A vertical gradient from a light purple to a lighter purple is used as the background for the main screen.

### Typography

- **Font:** The default Flutter font is used.
- **Font Size:** A variety of font sizes are used to create a visual hierarchy.

## Features

- **Market Watch Screen:** The main screen of the application, which displays a list of market data.
- **Tabs:** The screen is divided into four tabs: NSE FUTURES, NSE OPTION, MCX FUTURES, and MCX OPTIONS.
- **Search:** A search bar allows users to search for specific market data.
- **Bottom Navigation Bar:** A bottom navigation bar provides access to the application's main sections.
- **Floating Action Button:** A floating action button in the center of the bottom navigation bar provides a primary action for the user.
- **State Management:** The application uses the `flutter_bloc` package for state management. The `MarketWatchBloc` subscribes to a stream of market data and updates the UI in real-time.
- **Mock Socket Data Source:** The application uses a mock data source that simulates a socket connection, providing a stream of market data with randomly updated prices every second. The initial data is loaded from a JSON file.
- **Error Handling:** The application displays an error message when an error occurs.
- **Loading State:** The application displays a loading indicator while data is being fetched.
- **Empty State:** The application displays an empty state message when there is no data to display.
