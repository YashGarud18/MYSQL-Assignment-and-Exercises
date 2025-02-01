# -------------------------------------------------------- Assignment 1 ---------------------------------------------------#
/*                                - Pick 30 real-world databases (examples: Airline, Hospital, College, etc.).             */
/*								  - For each database, design 5 tables with at least 5 attributes each.                    */
# -------------------------------------------------------------------------------------------------------------------------#


-- ----------------1 database-----------------
-- Create database Airline
create database Airline;

-- Using the database 
use airline;

-- create 5 tables 
# Table_1
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    Departure VARCHAR(100),
    Arrival VARCHAR(100),
    Date DATE,
    Duration VARCHAR(10)
);

-- Insert values 
INSERT INTO Flights VALUES (1, 'New York', 'London', '2023-05-01', '7h 15m');
INSERT INTO Flights VALUES (2, 'Los Angeles', 'Tokyo', '2023-06-15', '11h 30m');
INSERT INTO Flights VALUES (3, 'Paris', 'Berlin', '2023-07-20', '1h 45m');


CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Passengers VALUES (1, 'Alice', 'Smith', 'alice@example.com', '1234567890');
INSERT INTO Passengers VALUES (2, 'Bob', 'Johnson', 'bob@example.com', '0987654321');
INSERT INTO Passengers VALUES (3, 'Charlie', 'Brown', 'charlie@example.com', '1122334455');


CREATE TABLE Crew (
    CrewID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50),
    FlightID INT,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- insert values
INSERT INTO Crew VALUES (1, 'Emily', 'Davis', 'Pilot', 1);
INSERT INTO Crew VALUES (2, 'Michael', 'Clark', 'Flight Attendant', 1);
INSERT INTO Crew VALUES (3, 'Sophia', 'Martinez', 'Pilot', 2);


CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    Price DECIMAL(10, 2),
    SeatNumber VARCHAR(5),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- insert values
INSERT INTO Tickets VALUES (1, 1, 1, 500.00, '12A');
INSERT INTO Tickets VALUES (2, 2, 1, 550.00, '14B');
INSERT INTO Tickets VALUES (3, 3, 2, 800.00, '3C');

CREATE TABLE Airports (
    AirportID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Code VARCHAR(10)
);

-- insert values
INSERT INTO Airports VALUES (1, 'John F. Kennedy International Airport', 'New York', 'USA', 'JFK');
INSERT INTO Airports VALUES (2, 'Heathrow Airport', 'London', 'UK', 'LHR');
INSERT INTO Airports VALUES (3, 'Los Angeles International Airport', 'Los Angeles', 'USA', 'LAX');




-- -----------------2 database-----------------
-- Create database 
create database HospitalD;

-- Using the database 
use HospitalD;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10)
);

-- insert values
INSERT INTO Patients VALUES (1, 'John', 'Doe', '1985-04-15', 'Male');
INSERT INTO Patients VALUES (2, 'Jane', 'Smith', '1990-11-22', 'Female');
INSERT INTO Patients VALUES (3, 'Robert', 'Brown', '1975-03-30', 'Male');

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Doctors VALUES (1, 'Dr. Sarah', 'Johnson', 'Cardiology', '123-456-7890');
INSERT INTO Doctors VALUES (2, 'Dr. David', 'Williams', 'Neurology', '987-654-3210');
INSERT INTO Doctors VALUES (3, 'Dr. Emma', 'Jones', 'Pediatrics', '456-789-0123');

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- insert values
INSERT INTO Appointments VALUES (1, 1, 1, '2023-08-01', '10:00');
INSERT INTO Appointments VALUES (2, 2, 2, '2023-08-02', '11:00');
INSERT INTO Appointments VALUES (3, 3, 3, '2023-08-03', '12:00');

CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY,
    TreatmentName VARCHAR(100),
    Cost DECIMAL(10, 2),
    Duration VARCHAR(10),
    DoctorID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- insert values
INSERT INTO Treatments VALUES (1, 'Heart Surgery', 20000.00, '5h', 1);
INSERT INTO Treatments VALUES (2, 'Brain Surgery', 30000.00, '7h', 2);
INSERT INTO Treatments VALUES (3, 'Routine Checkup', 150.00, '1h', 3);

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    Name VARCHAR(100),
    Dosage VARCHAR(50),
    SideEffects VARCHAR(255),
    PrescriptionID INT
);

-- insert values
INSERT INTO Medications VALUES (1, 'Aspirin', '500mg', 'Nausea', 1);
INSERT INTO Medications VALUES (2, 'Amoxicillin', '250mg', 'Allergic Reactions', 2);
INSERT INTO Medications VALUES (3, 'Ibuprofen', '200mg', 'Stomach Upset', 3);





-- ----------------- 3 database------------------
-- Create database 
create database CollegeD;

-- Using the database 
use CollegeD;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Major VARCHAR(100),
    EnrollmentDate DATE
);

-- insert values
INSERT INTO Students VALUES (1, 'Alice', 'Johnson', 'Computer Science', '2023-01-15');
INSERT INTO Students VALUES (2, 'Bob', 'Smith', 'Mathematics', '2023-02-20');
INSERT INTO Students VALUES (3, 'Charlie', 'Brown', 'History', '2023-03-10');

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    Department VARCHAR(100),
    Semester VARCHAR(20)
);

-- insert values
INSERT INTO Courses VALUES (1, 'Introduction to Programming', 3, 'Computer Science', 'Fall 2023');
INSERT INTO Courses VALUES (2, 'Calculus I', 4, 'Mathematics', 'Fall 2023');
INSERT INTO Courses VALUES (3, 'World History', 3, 'Humanities', 'Fall 2023');

CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(100),
    Email VARCHAR(100)
);

-- insert values
INSERT INTO Professors VALUES (1, 'Dr. Alice', 'Smith', 'Computer Science', 'asmith@college.edu');
INSERT INTO Professors VALUES (2, 'Dr. John', 'Doe', 'Mathematics', 'jdoe@college.edu');
INSERT INTO Professors VALUES (3, 'Dr. Emily', 'Johnson', 'History', 'ejohnson@college.edu');

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    Semester VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- insert values
INSERT INTO Enrollments VALUES (1, 1, 1, 'A', 'Fall 2023');
INSERT INTO Enrollments VALUES (2, 2, 2, 'B', 'Fall 2023');
INSERT INTO Enrollments VALUES (3, 3, 3, 'A', 'Fall 2023');

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Head VARCHAR(100),
    Budget DECIMAL(15, 2),
    Building VARCHAR(100)
);

-- insert values
INSERT INTO Departments VALUES (1, 'Computer Science', 'Dr. Smith', 50000.00, 'Building A');
INSERT INTO Departments VALUES (2, 'Mathematics', 'Dr. Doe', 30000.00, 'Building B');
INSERT INTO Departments VALUES (3, 'Humanities', 'Dr. Johnson', 40000.00, 'Building C');




-- -----------------4 database-----------------
-- Create database 
create database Ecommerce;

-- Using the database 
use Ecommerce;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

-- insert values
INSERT INTO Products VALUES (1, 'Laptop', 'Electronics', 999.99, 50);
INSERT INTO Products VALUES (2, 'Smartphone', 'Electronics', 599.99, 150);
INSERT INTO Products VALUES (3, 'Headphones', 'Electronics', 199.99, 200);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Customers VALUES (1, 'Alice', 'Johnson', 'alice@example.com', '1234567890');
INSERT INTO Customers VALUES (2, 'Bob', 'Smith', 'bob@example.com', '0987654321');
INSERT INTO Customers VALUES (3, 'Charlie', 'Brown', 'charlie@example.com', '1122334455');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- insert values
INSERT INTO Orders VALUES (1, 1, '2023-05-01', 999.99, 'Shipped');
INSERT INTO Orders VALUES (2, 2, '2023-06-15', 599.99, 'Processing');
INSERT INTO Orders VALUES (3, 3, '2023-07-20', 199.99, 'Delivered');

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- insert values
INSERT INTO OrderItems VALUES (1, 1, 1, 1, 999.99);
INSERT INTO OrderItems VALUES (2, 2, 2, 2, 1199.98);
INSERT INTO OrderItems VALUES (3, 3, 3, 1, 199.99);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    ParentID INT,
    Level INT
);

-- insert values
INSERT INTO Categories VALUES (1, 'Electronics', 'Devices and gadgets', NULL, 1);
INSERT INTO Categories VALUES (2, 'Clothing', 'Apparel and accessories', NULL, 1);
INSERT INTO Categories VALUES (3, 'Home', 'Furniture and decor', NULL, 1);





-- -----------------5 database-----------------
-- Create database 
create database LibraryM;

-- Using the database 
use LibraryM;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    ISBN VARCHAR(20),
    Genre VARCHAR(50)
);

-- insert values
INSERT INTO Books VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 'Fiction');
INSERT INTO Books VALUES (2, '1984', 'George Orwell', '9780451524935', 'Dystopian');
INSERT INTO Books VALUES (3, 'To Kill a Mockingbird', 'Harper Lee', '9780060935467', 'Fiction');

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    JoinDate DATE,
    Email VARCHAR(100)
);

-- insert values
INSERT INTO Members VALUES (1, 'John', 'Doe', '2023-01-15', 'john@example.com');
INSERT INTO Members VALUES (2, 'Jane', 'Smith', '2023-02-20', 'jane@example.com');
INSERT INTO Members VALUES (3, 'Bob', 'Brown', '2023-03-10', 'bob@example.com');

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- insert values
INSERT INTO Loans VALUES (1, 1, 1, '2023-08-01', '2023-08-15');
INSERT INTO Loans VALUES (2, 2, 2, '2023-08-02', '2023-08-16');
INSERT INTO Loans VALUES (3, 3, 3, '2023-08-03', '2023-08-17');

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Bio TEXT,
    Nationality VARCHAR(50)
);

-- insert values
INSERT INTO Authors VALUES (1, 'F. Scott', 'Fitzgerald', 'American author', 'USA');
INSERT INTO Authors VALUES (2, 'George', 'Orwell', 'British author', 'UK');
INSERT INTO Authors VALUES (3, 'Harper', 'Lee', 'American author', 'USA');

CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT,
    ParentGenreID INT,
    Popularity INT
);

-- inasert values
INSERT INTO Genres VALUES (1, 1, 'Alice', 5, 'A masterpiece of 20th-century literature.');
INSERT INTO Genres VALUES (2, 2, 'Bob', 4, 'A chilling depiction of totalitarianism.');
INSERT INTO Genres VALUES (3, 3, 'Charlie', 5, 'A profound commentary on racial injustice.');





-- -----------------6 database-----------------
-- Create database Airline
create database RealEstate;

-- Using the database 
use RealEstate;

CREATE TABLE Properties (
    PropertyID INT PRIMARY KEY,
    Address VARCHAR(255),
    Type VARCHAR(50),
    Price DECIMAL(15, 2),
    Status VARCHAR(50)
);

-- insert values
INSERT INTO Properties VALUES (1, 'Luxury Villa', 'Los Angeles', 2000000.00, 4);
INSERT INTO Properties VALUES (2, 'City Apartment', 'New York', 750000.00, 2);
INSERT INTO Properties VALUES (3, 'Countryside Cottage', 'Napa Valley', 500000.00, 3);

CREATE TABLE Agents (
    AgentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- insert values
INSERT INTO Agents VALUES (1, 'Alice', 'Smith', 'alice@realestate.com', '1234567890');
INSERT INTO Agents VALUES (2, 'Bob', 'Johnson', 'bob@realestate.com', '0987654321');
INSERT INTO Agents VALUES (3, 'Charlie', 'Brown', 'charlie@realestate.com', '1122334455');

CREATE TABLE Buyers (
    BuyerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- insert values
INSERT INTO Buyers VALUES (1, 'Alice', 'Smith', 'alice@realestate.com', '1234567890');
INSERT INTO Buyers VALUES (2, 'Bob', 'Johnson', 'bob@realestate.com', '0987654321');
INSERT INTO Buyers VALUES (3, 'Charlie', 'Brown', 'charlie@realestate.com', '1122334455');

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    PropertyID INT,
    BuyerID INT,
    AgentID INT,
    SaleDate DATE,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID),
    FOREIGN KEY (BuyerID) REFERENCES Buyers(BuyerID),
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
);

-- insert values
INSERT INTO Sales VALUES (1, 1, 1, '2023-05-01', 2000000.00);
INSERT INTO Sales VALUES (2, 2, 2, '2023-06-15', 750000.00);
INSERT INTO Sales VALUES (3, 3, 3, '2023-07-20', 500000.00);

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(10),
    Country VARCHAR(100)
);

-- insert values
INSERT INTO Locations VALUES (1, 'Kalyan', 'Maha', '421306', 'India');
INSERT INTO Locations VALUES (2, 'Londan', 'UK', '20013', 'Europe');
INSERT INTO Locations VALUES (3, 'Rio-D', 'Arica', '3235415', 'Africa');





-- -----------------7 database-----------------
-- Create database Airline
create database Airline;

-- Using the database 
use airline;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Email VARCHAR(100),
    PasswordHash VARCHAR(255),
    JoinDate DATE
);

-- insert values
INSERT INTO Users VALUES (1, 'Alice Johnson', 'alice@example.com', 'alice123', '2022-01-15');
INSERT INTO Users VALUES (2, 'Bob Smith', 'bob@example.com', 'bob456', '2022-02-20');
INSERT INTO Users VALUES (3, 'Charlie Brown', 'charlie@example.com', 'charlie789', '2022-03-10');

CREATE TABLE Posts (
    PostID INT PRIMARY KEY,
    UserID INT,
    Content TEXT,
    CreatedAt DATETIME,
    Likes INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- insert values
INSERT INTO Posts VALUES (1, 1, 'Hello, world!', '2023-08-01');
INSERT INTO Posts VALUES (2, 2, 'Just had a great lunch!', '2023-08-02');
INSERT INTO Posts VALUES (3, 3, 'Loving the new book I started!', '2023-08-03');

CREATE TABLE Comments (
    CommentID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Content TEXT,
    CreatedAt DATETIME,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- insert values
INSERT INTO Comments VALUES (1, 1, 2, 'Welcome to the platform!');
INSERT INTO Comments VALUES (2, 2, 1, 'What did you have for lunch?');
INSERT INTO Comments VALUES (3, 3, 3, 'What book are you reading?');

CREATE TABLE Followers (
    UserID1 INT,
    UserID2 INT,
    Status VARCHAR(20),
    CreatedAt DATETIME,
    PRIMARY KEY (UserID1, UserID2),
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID)
);

-- insert values
INSERT INTO Followers VALUES (1, 2, '2023-08-01');
INSERT INTO Followers VALUES (2, 1, '2023-08-02');
INSERT INTO Followers VALUES (3, 3, '2023-08-03');

CREATE TABLE Likes (
    MessageID INT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    Content TEXT,
    CreatedAt DATETIME,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

-- insert values
INSERT INTO Likes VALUES (1, 1, 1);
INSERT INTO Likes VALUES (2, 2, 1);
INSERT INTO Likes VALUES (3, 3, 2);





-- -----------------8 database-----------------
-- Create database 
create database Restaurants;

-- Using the database 
use Restaurant;

CREATE TABLE Rest_detail (
    Rest_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Cuisine VARCHAR(50),
    Rating DECIMAL(2, 1)
);

-- insert values
INSERT INTO Rest_detail VALUES (1, 'Pasta Palace', 'New York', 'Italian', 4.5);
INSERT INTO Rest_detail VALUES (2, 'Sushi Haven', 'San Francisco', 'Japanese', 4.8);
INSERT INTO Rest_detail VALUES (3, 'Taco Town', 'Los Angeles', 'Mexican', 4.3);

CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    RestaurantID INT,
    ItemName VARCHAR(100),
    Price DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- inser values
INSERT INTO MenuItems VALUES (1, 1, 'Spaghetti Carbonara', 15.99, 'Classic Italian pasta with egg and cheese.');
INSERT INTO MenuItems VALUES (2, 2, 'California Roll', 12.50, 'Sushi roll with crab and avocado.');
INSERT INTO MenuItems VALUES (3, 3, 'Fish Tacos', 10.99, 'Soft tacos filled with grilled fish and salsa.');

CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    RestaurantID INT,
    CustomerName VARCHAR(100),
    ReservationDate DATE,
    PartySize INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- insert values
INSERT INTO Reservations VALUES (1, 1, 'Alice Johnson', '2023-08-10', 4);
INSERT INTO Reservations VALUES (2, 2, 'Bob Smith', '2023-08-11', 2);
INSERT INTO Reservations VALUES (3, 3, 'Charlie Brown', '2023-08-12', 6);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    RestaurantID INT,
    CustomerName VARCHAR(100),
    Rating INT,
    Comments TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- insert values
INSERT INTO Reviews VALUES (1, 1, 'John Doe', 5, 'Fantastic food and great atmosphere!');
INSERT INTO Reviews VALUES (2, 2, 'Jane Smith', 4, 'Delicious sushi, but a bit pricey.');
INSERT INTO Reviews VALUES (3, 3, 'Emily Davis', 3, 'Good tacos, but the service was slow.');

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    RestaurantID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- insert values
INSERT INTO Staff VALUES (1, 1, 'Maria', 'Gonzalez', 'Chef');
INSERT INTO Staff VALUES (2, 2, 'Tom', 'Williams', 'Server');
INSERT INTO Staff VALUES (3, 3, 'Sarah', 'Brown', 'Manager');




-- -----------------9 database-----------------
-- Create database 
create database HotelM;

-- Using the HotelM 
use HotelM;

CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Rating DECIMAL(2, 1),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Hotels VALUES (1, 'Grand Hotel', 'New York', 5, 200);
INSERT INTO Hotels VALUES (2, 'Beach Resort', 'Miami', 4, 150);
INSERT INTO Hotels VALUES (3, 'Mountain Lodge', 'Aspen', 5, 100);


CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    HotelID INT,
    RoomType VARCHAR(50),
    Price DECIMAL(10, 2),
    Availability BOOLEAN,
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

-- insert values
INSERT INTO Rooms VALUES (1, 101, 1, 2, 250.00);
INSERT INTO Rooms VALUES (2, 102, 2, 4, 300.00);
INSERT INTO Rooms VALUES (3, 103, 3, 1, 450.00);


CREATE TABLE Guests (
    GuestID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Guests VALUES (1, 'John', 'Doe', 'john@example.com', '1234567890');
INSERT INTO Guests VALUES (2, 'Jane', 'Smith', 'jane@example.com', '0987654321');
INSERT INTO Guests VALUES (3, 'Alice', 'Johnson', 'alice@example.com', '1122334455');


CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    RoomID INT,
    GuestID INT,
    CheckIn DATE,
    CheckOut DATE,
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID)
);

-- insert values
INSERT INTO Bookings VALUES (1, 1, 1, '2023-08-01', '2023-08-07');
INSERT INTO Bookings VALUES (2, 2, 2, '2023-08-02', '2023-08-10');
INSERT INTO Bookings VALUES (3, 3, 3, '2023-08-03', '2023-08-15');


CREATE TABLE Amenities (
    AmenityID INT PRIMARY KEY,
    HotelID INT,
    AmenityName VARCHAR(100),
    Description TEXT,
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

-- insert values
INSERT INTO Amenities VALUES (1, 1, 'Free Wi-Fi', 'Complimentary Wi-Fi in all rooms');
INSERT INTO Amenities VALUES (2, 1, 'Swimming Pool', 'Outdoor pool open year-round');
INSERT INTO Amenities VALUES (3, 2, 'Gym', '24-hour fitness center available');




-- -----------------10 database-----------------
-- Create database 
create database Fitness_center;

-- Using the database 
use Fitness_center;

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Members VALUES (1, 'Alice', 'Johnson', 'alice@example.com', '1234567890');
INSERT INTO Members VALUES (2, 'Bob', 'Smith', 'bob@example.com', '0987654321');
INSERT INTO Members VALUES (3, 'Charlie', 'Brown', 'charlie@example.com', '1122334455');

CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Trainers VALUES (1, 'Emily', 'Davis', 'Yoga', '123-456-7890');
INSERT INTO Trainers VALUES (2, 'Michael', 'Clark', 'Weightlifting', '987-654-3210');
INSERT INTO Trainers VALUES (3, 'Sophia', 'Martinez', 'Cardio', '456-789-0123');

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    TrainerID INT,
    Schedule VARCHAR(50),
    MaxParticipants INT,
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);

-- insert values
INSERT INTO Classes VALUES (1, 'Yoga', 1, 'Monday 10:00 AM', 20);
INSERT INTO Classes VALUES (2, 'Zumba', 2, 'Wednesday 6:00 PM', 25);
INSERT INTO Classes VALUES (3, 'Spin', 3, 'Friday 5:00 PM', 30);


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    MemberID INT,
    ClassID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- insert values
INSERT INTO Enrollments VALUES (1, 1, 1, '2023-08-01');
INSERT INTO Enrollments VALUES (2, 2, 2, '2023-08-02');
INSERT INTO Enrollments VALUES (3, 3, 3, '2023-08-03');


CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Quantity INT,
    Location VARCHAR(100)
);

-- insert values
INSERT INTO Equipment VALUES (1, 'Treadmill', 'Cardio', 10, 'Gym Area');
INSERT INTO Equipment VALUES (2, 'Dumbbells', 'Weights', 20, 'Weight Room');
INSERT INTO Equipment VALUES (3, 'Yoga Mats', 'Yoga', 15, 'Yoga Studio');




-- ----------------- 11 database -----------------
-- Create database 
create database Movie;

-- Using the database 
use Movie;

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT,
    Rating DECIMAL(2, 1)
);

-- insert values
INSERT INTO Movies VALUES (1, 'Inception', 'Sci-Fi', 2010, 8.8);
INSERT INTO Movies VALUES (2, 'The Shawshank Redemption', 'Drama', 1994, 9.3);
INSERT INTO Movies VALUES (3, 'The Godfather', 'Crime', 1972, 9.2);

CREATE TABLE Actors (
    ActorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Nationality VARCHAR(50)
);

-- inset values
INSERT INTO Actors VALUES (1, 'Leonardo', 'DiCaprio', '1974-11-11', 'American');
INSERT INTO Actors VALUES (2, 'Morgan', 'Freeman', '1937-06-01', 'American');
INSERT INTO Actors VALUES (3, 'Al', 'Pacino', '1940-04-25', 'American');

CREATE TABLE Directors (
    DirectorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Nationality VARCHAR(50)
);

-- insert values
INSERT INTO Directors VALUES (1, 'Christopher', 'Nolan', '1970-07-30', 'British');
INSERT INTO Directors VALUES (2, 'Frank', 'Darabont', '1959-01-28', 'American');
INSERT INTO Directors VALUES (3, 'Francis', 'Ford Coppola', '1939-04-07', 'American');

CREATE TABLE MovieActors (
    MovieID INT,
    ActorID INT,
    Role VARCHAR(100),
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)
);

-- insert values
INSERT INTO MovieActors VALUES (1, 1, 'Dom Cobb');
INSERT INTO MovieActors VALUES (2, 2, 'Ellis Redding');
INSERT INTO MovieActors VALUES (3, 3, 'Michael Corleone');

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    MovieID INT,
    ReviewerName VARCHAR(100),
    Rating INT,
    Comments TEXT,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- insert values
INSERT INTO Reviews VALUES (1, 1, 'Alice', 5, 'Mind-bending and visually stunning.');
INSERT INTO Reviews VALUES (2, 2, 'Bob', 5, 'An inspiring story of hope.');
INSERT INTO Reviews VALUES (3, 3, 'Charlie', 5, 'A masterpiece of cinema.');




-- ----------------- 12 database -----------------
-- Create database 
create database Transportation;

-- Using the database 
use Transportation;

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    LicensePlate VARCHAR(15)
);

-- insert values
INSERT INTO Vehicles VALUES (1, 'Toyota', 'Camry', 2020, 'ABC123');
INSERT INTO Vehicles VALUES (2, 'Honda', 'Civic', 2021, 'DEF456');
INSERT INTO Vehicles VALUES (3, 'Ford', 'Focus', 2019, 'GHI789');

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    LicenseNumber VARCHAR(15),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Drivers VALUES (1, 'John', 'Doe', 'D123456789', '123-456-7890');
INSERT INTO Drivers VALUES (2, 'Jane', 'Smith', 'D987654321', '098-765-4321');
INSERT INTO Drivers VALUES (3, 'Bob', 'Brown', 'D456789123', '112-233-4455');

CREATE TABLE Routes (
    RouteID INT PRIMARY KEY,
    StartLocation VARCHAR(100),
    EndLocation VARCHAR(100),
    Distance DECIMAL(10, 2),
    EstimatedTime VARCHAR(20)
);

-- insert values
INSERT INTO Routes VALUES (1, 'New York', 'Boston', 215.00, '4h');
INSERT INTO Routes VALUES (2, 'Los Angeles', 'San Francisco', 382.00, '6h');
INSERT INTO Routes VALUES (3, 'Chicago', 'Detroit', 281.00, '5h');

CREATE TABLE Trips (
    TripID INT PRIMARY KEY,
    VehicleID INT,
    DriverID INT,
    RouteID INT,
    TripDate DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

-- insert values
INSERT INTO Trips VALUES (1, 1, 1, 1, '2023-08-01');
INSERT INTO Trips VALUES (2, 2, 2, 2, '2023-08-02');
INSERT INTO Trips VALUES (3, 3, 3, 3, '2023-08-03');

CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY,
    VehicleID INT,
    MaintenanceDate DATE,
    Description TEXT,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

-- insert values
INSERT INTO Maintenance VALUES (1, 1, '2023-01-01', 'Oil Change', 30.00);
INSERT INTO Maintenance VALUES (2, 2, '2023-01-15', 'Tire Rotation', 50.00);
INSERT INTO Maintenance VALUES (3, 3, '2023-02-01', 'Brake Inspection', 75.00);




-- ----------------- 13 database -----------------
-- Create database 
create database Charity ;

-- Using the database 
use Charity ;

CREATE TABLE Charities (
    CharityID INT PRIMARY KEY,
    Name VARCHAR(100),
    Mission VARCHAR(255),
    Founded DATE,
    Location VARCHAR(100)
);

-- insert values
INSERT INTO Charities VALUES (1, 'Save the Children', 'Helping children worldwide', '1919-04-05', 'USA');
INSERT INTO Charities VALUES (2, 'World Wildlife Fund', 'Conserving nature', '1961-04-29', 'Global');
INSERT INTO Charities VALUES (3, 'Habitat for Humanity', 'Building homes for families', '1976-10-04', 'USA');

CREATE TABLE Donors (
    DonorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- insert values
INSERT INTO Donors VALUES (1, 'Alice', 'Johnson', 'alice@example.com', '1234567890');
INSERT INTO Donors VALUES (2, 'Bob', 'Smith', 'bob@example.com', '0987654321');
INSERT INTO Donors VALUES (3, 'Charlie', 'Brown', 'charlie@example.com', '1122334455');

CREATE TABLE Donations (
    DonationID INT PRIMARY KEY,
    CharityID INT,
    DonorID INT,
    Amount DECIMAL(10, 2),
    DonationDate DATE,
    FOREIGN KEY (CharityID) REFERENCES Charities(CharityID),
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
);

-- insert values
INSERT INTO Donations VALUES (1, 1, 1, 500.00, '2023-05-01');
INSERT INTO Donations VALUES (2, 2, 2, 150.00, '2023-06-15');
INSERT INTO Donations VALUES (3, 3, 3, 1000.00, '2023-07-20');

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    CharityID INT,
    Title VARCHAR(100),
    Date DATE,
    Location VARCHAR(100),
    FOREIGN KEY (CharityID) REFERENCES Charities(CharityID)
);

-- insert values
INSERT INTO Events VALUES (1, 1, 'Charity Run', '2023-08-01', 'Central Park');
INSERT INTO Events VALUES (2, 2, 'Wildlife Gala', '2023-09-10', 'Downtown');
INSERT INTO Events VALUES (3, 3, 'Build Day', '2023-10-05', 'Community Center');

CREATE TABLE VolunteerOpportunities (
    OpportunityID INT PRIMARY KEY,
    CharityID INT,
    Title VARCHAR(100),
    Description TEXT,
    Date DATE,
    FOREIGN KEY (CharityID) REFERENCES Charities(CharityID)
);

-- insert values
INSERT INTO VolunteerOpportunities VALUES (1, 1, 'Help with Fundraising', 'Assist in organizing fundraising events', '2023-08-01');
INSERT INTO VolunteerOpportunities VALUES (2, 2, 'Wildlife Monitoring', 'Help monitor wildlife in local areas', '2023-09-01');
INSERT INTO VolunteerOpportunities VALUES (3, 3, 'Build Homes', 'Join us in building homes for families', '2023-10-01');




-- ----------------- 14 database -----------------
-- Create database 
create database Agricultural ;

-- Using the database 
use Agricultural ;

CREATE TABLE Farmers (
    FarmID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Size DECIMAL(10, 2),
    Owner VARCHAR(100)
);

-- ibnsert values
INSERT INTO Farmers VALUES (1, 'Alice', 'Johnson', 'alice@example.com', '1234567890');
INSERT INTO Farmers VALUES (2, 'Bob', 'Smith', 'bob@example.com', '0987654321');
INSERT INTO Farmers VALUES (3, 'Charlie', 'Brown', 'charlie@example.com', '1122334455');

CREATE TABLE Crops (
    CropID INT PRIMARY KEY,
    Name VARCHAR(100),
    Season VARCHAR(50),
    YieldPerAcre DECIMAL(10, 2),
    FarmID INT,
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- insert values
INSERT INTO Crops VALUES (1, 'Corn', 'Maize', 'High yield', '2023-04-15');
INSERT INTO Crops VALUES (2, 'Wheat', 'Cereal', 'Drought resistant', '2023-05-01');
INSERT INTO Crops VALUES (3, 'Rice', 'Grain', 'Flood tolerant', '2023-06-01');

CREATE TABLE Livestock (
    LivestockID INT PRIMARY KEY,
    Type VARCHAR(50),
    Quantity INT,
    FarmID INT,
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Quantity INT,
    FarmID INT,
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- insert values
INSERT INTO Equipment VALUES (1, 'Equipment A', 'Effective against pests', 50.00);
INSERT INTO Equipment VALUES (2, 'Equipment B', 'Organic formula', 60.00);
INSERT INTO Equipment VALUES (3, 'Equipment C', 'Fast-acting', 45.00);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CropID INT,
    QuantitySold INT,
    SaleDate DATE,
    Price DECIMAL(10, 2),
    FOREIGN KEY (CropID) REFERENCES Crops(CropID)
);

-- insert values
INSERT INTO Sales VALUES (1, 1, 1000.00, '2023-09-05');
INSERT INTO Sales VALUES (2, 2, 2000.00, '2023-09-20');
INSERT INTO Sales VALUES (3, 3, 1500.00, '2023-10-05');



-- ----------------- 15 database -----------------
-- Create database 
create database Agricultural ;

-- Using the database 
use Agricultural ;