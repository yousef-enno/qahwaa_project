# ☕ Qahwaa Project
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/yousef-enno/qahwaa_project)

Qahwaa (قهوة) is a Flutter-based mobile application designed to simplify order management for coffee shops. It provides an intuitive interface for staff to add new customer orders, track their status, and generate insightful sales reports.

## ✨ Features

- **Order Management:** Create new orders with customer name, a choice of drink (`Shai`, `Turkish Coffee`, `Hibiscus`), and any special notes.
- **Order Tracking:** View a live list of pending orders and mark them as "Done" upon completion.
- **Reporting:** Generate a summary report that includes the total number of completed orders and identifies the most popular drink.

## 📸 Screenshots

| Dashboard | Add Order | Orders | Report |
| :---: | :---: | :---: | :---: |
| <img width="250" alt="Dashboard screen" src="https://github.com/user-attachments/assets/bec360f0-b9ad-416f-9e7a-0e4cd5ccd3e3" /> | <img width="250" alt="Add new order" src="https://github.com/user-attachments/assets/c230a02f-8b46-42a1-bbf0-ef035c9ba3de" /> | <img width="250" alt="Orders screen" src="https://github.com/user-attachments/assets/3cae3942-cd25-4d47-8acf-b3f4d095bfa9" /> | <img width="250" alt="Report screen" src="https://github.com/user-attachments/assets/2c66c200-1b8d-4560-9763-8219fb96564a" /> |

<br/>

## 🏗️ Architecture & Tech Stack

This project is built with **Flutter** for the UI and **Dart** for the business logic, adhering to clean architecture principles.

- **State Management:** Simple state management using `StatefulWidget` is employed for managing the UI state, which is suitable for the app's current scope.
- **Design Principles:** The application is built on a foundation of Object-Oriented Programming (OOP) and SOLID principles, emphasizing encapsulation, abstraction, and polymorphism to create a maintainable and scalable codebase.
- **Data Layer:** A repository pattern (`OrderRepo`) is used to abstract data operations. The current implementation uses an in-memory repository (`InMemoryOrderRepo`) for simplicity.

## 📂 Project Structure

The core application logic is organized within the `lib` directory as follows:

```
lib/
├── data/
│   ├── models/
│   │   ├── drink_model.dart
│   │   └── order.dart
│   ├── repo/
│   │   ├── in_memory_order_repo.dart
│   │   └── order_repo.dart
│   └── services/
│       ├── order_manager.dart
│       └── report.dart
├── views/
│   ├── qahwaa_dashboard.dart
│   └── report_view.dart
└── main.dart
```

## 🚀 Getting Started

To run this project locally, ensure you have the Flutter SDK installed on your machine.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yousef-enno/qahwaa_project.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd qahwaa_project
    ```
3.  **Install the dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the application:**
    ```bash
    flutter run
