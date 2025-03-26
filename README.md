# BookHub Database - Advanced Database Project

**BookHub - Databases** is a project that explores database operations and data modeling by leveraging both **MySQL** and **MongoDB**.
It applies advanced database concepts through the integration of relational and NoSQL databases, demonstrating their complementary roles in managing structured and unstructured data efficiently.

## Overview

The system utilizes two databases:

1. **MySQL** – Manages structured data, including users, books, authors, publishers, categories, and orders.
2. **MongoDB** – Stores unstructured data, specifically book reviews and user activity logs ensuring flexible and efficient retrieval.

## Implementation
**MySQL**
- The system consists of **six primary tables** and **two junction tables** for data relationships.
- Supports **basic CRUD operations** for managing records.
- Utilizes **MySQL aggregate functions** for data analysis.
- Implements a **stored procedure** to facilitate order creation.
- Includes a **trigger** to automatically update book stock when an order is canceled.

**MongoDB**
- The system includes two collections,
  - **reviews**, dedicated to storing user-submitted book reviews.
  - **user_activity_logs**, dedicated to storing users' activities logs.
- Provides **basic CRUD operations** for managing **reviews** and **user_activity_logs** documents.
- Leverages **MongoDB aggregate functions** for data analysis, such as calculating average ratings.

## Technologies Used

- **Database:**
    - **MySQL**: Manages relational data, including users, books, and orders.
    - **MongoDB**: Stores book reviews for flexible and efficient retrieval.

- **Tools:**
    - **MySQL Workbench**: Used for managing and querying the MySQL database.
    - **Visual Studio Code**: Utilized for handling MongoDB scripts and operations.

## Database Schema

### MySQL:
- **Users**: Information about registered users.
- **Books**: Book details such as isbn, title, price, and stock.
- **Authors**: Authors that books belong to (e.g., J. K. Rowling)
- **Publishers**: Publishers that books belong to (e.g., The Penguin Publishing Group).
- **Categories**: Categories that books belong to (e.g., fiction, non-fiction).
- **Orders**: Information about customer orders.

### MongoDB:
- **Book Reviews**: Stores user-submitted reviews for each book in **MongoDB**, ensuring efficient retrieval and scalability.
- **User Activity Logs**: Tracks user interactions within the system, such as order submissions by users with the **USER** role and status updates by users with the **ADMIN** role.

## Setup and Installation

### Prerequisites
- **MySQL 9.2.0** installed and running
- **MongoDB v8.0.5** installed and running

### Execution Steps

#### **MySQL Database**
##### **Database and Table Creation**
- Run `Create Database.sql` to initialize the database.
- Execute `Create Tables.sql` to create the required tables.
- Run `Add Order.sql` to set up the stored procedure for order creation.
- Execute `Update Book Quantity After Order Cancel.sql` to define the trigger for stock updates.

##### **Data Insertion**
- Run `Data Insertion.sql` to populate tables with initial data.

##### **Query Execution**
- Use `Select Query.sql` for data retrieval.
- Run `Update Query.sql` to modify existing records.
- Execute `Delete Query.sql` to remove data as needed.

#### **MongoDB**
##### **Database and Collection Creation**
- Execute `Reviews Collection.js` to create the **reviews** collection.
- Run `User Activity Logs Collection.js` to create the **user activity logs** collection.

##### **Inserting Documents**
- Execute `Reviews Collection.js` to insert book reviews.
- Run `User Activity Logs Collection.js` to log user activities.

##### **Querying Documents**
- Use `Reviews Collection.js` to retrieve review data.
- Run `User Activity Logs Collection.js` to fetch user activity logs.
