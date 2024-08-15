# ObiletCase

ObiletCase is an iOS application built using Swift, focusing on product display and filtering functionalities. It fetches product data from a fake online store API and displays it in a user-friendly interface with category filtering and search capabilities.

## Features

- **Product Listing**: Fetches products from an online API and displays them in a list format.
- **Category Filtering**: Users can filter products by categories such as Electronics, Jewelry, Men's Clothing, and Women's Clothing.
- **Search Functionality**: Users can search for products by title.
- **Product Details**: Tapping on a product opens a detailed view showing the product image, description, price, and rating.

## Screenshots

### Home Screen
<img width="300" height="600" alt="Screenshot 2023-07-11 at 00 54 50" src="https://github.com/user-attachments/assets/9e400b2e-5064-4834-897f-b75eeefcc823">
<img width="300" height="600" alt="Screenshot 2023-07-11 at 00 54 50" src="https://github.com/user-attachments/assets/7582e9ad-77b1-4996-b057-efd4e62ee392">
<img width="300" height="600" alt="Screenshot 2023-07-11 at 00 54 50" src="https://github.com/user-attachments/assets/7da57f06-9310-48b6-9fd6-b258cf4700e5">
<img width="300" height="600" alt="Screenshot 2023-07-11 at 00 54 50" src="https://github.com/user-attachments/assets/fde48cd5-45dd-4551-8455-d56481964ebf">

### Product Details
<img width="300" height="600" alt="Screenshot 2023-07-11 at 00 54 50" src="https://github.com/user-attachments/assets/1ab85470-e59d-424a-9c0c-cef815266661">
<img width="300" height="600" alt="Screenshot 2023-07-11 at 00 54 50" src="https://github.com/user-attachments/assets/4c40fbbe-3800-428a-9d52-28b4dec392b4">
<img width="300" height="600" alt="Screenshot 2023-07-11 at 00 54 50" src="https://github.com/user-attachments/assets/4e3411fd-b1ac-4ecb-b62d-01f624dd28a9">

## Code Overview

### Architecture

The project follows the MVVM (Model-View-ViewModel) architecture, making the code modular, testable, and easier to maintain.

- **Model**: `ProductModel.swift` defines the structure of the data retrieved from the API.
- **ViewModel**: `HomeViewModel` and `DetailViewModel` manages the logic for filtering and searching products.
- **View**: The UI is composed of `HomeViewController`, `DetailViewController`, `HomeTableViewCell`, and `CategoryCollectionViewCell`.

### Networking

- **API Caller**: `APICaller.swift` handles network requests to fetch product data.
- **Service Constants**: `ServiceConstants.swift` defines the base URL for the API.

### UI Components

- **HomeViewController**: Displays the main screen with a search bar, category filters, and a product list.
- **DetailViewController**: Shows detailed information about a selected product.
- **HomeTableViewCell**: A custom table view cell used in the product list.
- **CategoryCollectionViewCell**: A custom collection view cell used for category filtering.

## Dependencies

- [SnapKit](https://github.com/SnapKit/SnapKit) - Used for Auto Layout constraints in code.
- [SDWebImage](https://github.com/SDWebImage/SDWebImage) - Used for loading and caching images from URLs.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/fazlialtunn/obiletCase.git
    ```

2. Open the project in Xcode:

    ```bash
    cd obiletcase
    open obiletcase.xcodeproj
    ```

3. Install dependencies:

    ```bash
    pod install
    ```

4. Run the project on the simulator or a real device.

## Usage

1. Launch the app on your iOS device.
2. Use the search bar to find specific products.
3. Tap on any category in the horizontal collectionview.
3. Tap on any category in the horizontal collection view to filter products.
4. Tap on a product to view its details.

