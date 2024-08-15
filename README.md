![Simulator Screenshot - iPhone 15 Pro - 2024-08-16 at 00 29 14](https://github.com/user-attachments/assets/bbb2f909-9a37-408b-bef0-46abaf6c01ab)# ObiletCase

ObiletCase is an iOS application built using Swift, focusing on product display and filtering functionalities. It fetches product data from a fake online store API and displays it in a user-friendly interface with category filtering and search capabilities.

## Features

- **Product Listing**: Fetches products from an online API and displays them in a list format.
- **Category Filtering**: Users can filter products by categories such as Electronics, Jewelry, Men's Clothing, and Women's Clothing.
- **Search Functionality**: Users can search for products by title.
- **Product Details**: Tapping on a product opens a detailed view showing the product image, description, price, and rating.

## Screenshots

| Home Screen | Product Details |
|-------------|-----------------|
| ![Home Screen] ![Simulator Screenshot - iPhone 15 Pro - 2024-08-16 at 00 29 14](https://github.com/user-attachments/assets/9e400b2e-5064-4834-897f-b75eeefcc823)
| ![Product Details](path_to_product_details_image)![Simulator Screenshot - iPhone 15 Pro - 2024-08-16 at 00 29 26](https://github.com/user-attachments/assets/1ab85470-e59d-424a-9c0c-cef815266661)
 |

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

