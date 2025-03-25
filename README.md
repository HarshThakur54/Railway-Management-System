 Railway Reservation System


The Railway Reservation System is a Java-based application designed to manage train schedules, ticket bookings, passenger details, and route handling. The system uses Java Swing for the GUI and MySQL for data storage.

Features
- Train schedule management
- Ticket booking and cancellation
- Passenger details management
- Route and trip handling

Technologies Used
- **Java** (OOP, Swing for GUI)
- **MySQL** (Database management)
- **Eclipse IDE** (Development environment)

## Project Structure
```
RailwayReservationSystem/
├── src/
│   ├── Employees/
│   ├── Passengers/
│   ├── Trains/
│   ├── Trips/
│   ├── Main.java
├── database/
│   ├── schema.sql
│   ├── data.sql
├── README.md
```

## Installation
### Prerequisites
- Java Development Kit (JDK) 11 or later
- MySQL Server
- Eclipse IDE (recommended)

### Setup Instructions
1. **Clone the Repository**
   ```sh
   git clone https://github.com/your-username/RailwayReservationSystem.git
   cd RailwayReservationSystem
   ```
2. **Import Project into Eclipse**
   - Open Eclipse
   - Select `File` > `Import` > `Existing Projects into Workspace`
   - Browse to the cloned repository folder and import the project

3. **Configure MySQL Database**
   - Open MySQL Workbench or Command Line Client
   - Execute `schema.sql` to create the database
   - Execute `data.sql` to populate initial data
   - Update database connection settings in the Java files if necessary

4. **Run the Application**
   - Open `Main.java` in Eclipse
   - Click `Run` to start the application

## Usage
- **Booking a Ticket**: Enter passenger details, select a train, and confirm booking.
- **Cancelling a Ticket**: Enter the ticket ID and confirm cancellation.
- **Viewing Schedule**: Browse available trains and routes.

## Contributing
Contributions are welcome! Follow these steps:
1. Fork the repository
2. Create a new branch (`git checkout -b feature-name`)
3. Commit your changes (`git commit -m "Add new feature"`)
4. Push to the branch (`git push origin feature-name`)
5. Open a Pull Request

## License
This project is licensed under the MIT License.

## Contact
For any issues or suggestions, open an issue or contact me.

