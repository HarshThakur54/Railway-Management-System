package Trips;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;

import Employees.Employee;
import Passengers.Passenger;
import Trains.Train;

public class Trip {
    private int id;
    private String start;
    private String destination;
    private LocalTime departureTime;
    private LocalTime arrivalTime;
    private LocalDate date;
    private int bookedSeats;
    private double price;
    private Employee driver;
    private Train train;
    private ArrayList<Passenger> passengers = new ArrayList<>();

    private DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

    public Trip() {}

    public int getID() {
        return id;
    }
    public void setID(int id) {
        this.id = id;
    }
    public String getStart() {
        return start;
    }
    public void setStart(String start) {
        this.start = start;
    }
    public String getDestination() {
        return destination;
    }
    public void setDestination(String destination) {
        this.destination = destination;
    }
    public String getDepartureTime() {
        return departureTime != null ? departureTime.format(timeFormatter) : "N/A";
    }
    public void setDepartureTime(String departureTime) {
        try {
            this.departureTime = LocalTime.parse(departureTime, timeFormatter);
        } catch (DateTimeParseException e) {
            System.err.println("Invalid time format for departure time. Please use HH:mm.");
        }
    }
    public String getArrivalTime() {
        return arrivalTime != null ? arrivalTime.format(timeFormatter) : "N/A";
    }
    public void setArrivalTime(String arrivalTime) {
        try {
            this.arrivalTime = LocalTime.parse(arrivalTime, timeFormatter);
        } catch (DateTimeParseException e) {
            System.err.println("Invalid time format for arrival time. Please use HH:mm.");
        }
    }
    public String getDate() {
        return date != null ? date.format(dateFormatter) : "N/A";
    }
    public void setDate(String date) {
        try {
            this.date = LocalDate.parse(date, dateFormatter);
        } catch (DateTimeParseException e) {
            System.err.println("Invalid date format. Please use yyyy-MM-dd.");
        }
    }
    public int getBookedSeats() {
        return bookedSeats;
    }
    public void setBookedSeats(int bookedSeats) {
        this.bookedSeats = bookedSeats;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public Employee getDriver() {
        return driver;
    }
    public void setDriver(Employee driver) {
        this.driver = driver;
    }
    public Train getTrain() {
        return train;
    }
    public void setTrain(Train train) {
        this.train = train;
    }
    public ArrayList<Passenger> getPassengers() {
        return passengers;
    }
    public void setPassengers(ArrayList<Passenger> passengers) {
        this.passengers = passengers;
    }
    public void addPassenger(Passenger passenger) {
        passengers.add(passenger);
    }
    public String getDay() {
        return date != null ? date.format(DateTimeFormatter.ofPattern("dd")) : "N/A";
    }
    public String getMonth() {
        return date != null ? date.format(DateTimeFormatter.ofPattern("MM")) : "N/A";
    }
    public String getYear() {
        return date != null ? date.format(DateTimeFormatter.ofPattern("yyyy")) : "N/A";
    }
    public String getDeptHour() {
        return departureTime != null ? departureTime.format(DateTimeFormatter.ofPattern("HH")) : "N/A";
    }
    public String getDeptMin() {
        return departureTime != null ? departureTime.format(DateTimeFormatter.ofPattern("mm")) : "N/A";
    }
    public String getArrHour() {
        return arrivalTime != null ? arrivalTime.format(DateTimeFormatter.ofPattern("HH")) : "N/A";
    }
    public String getArrMin() {
        return arrivalTime != null ? arrivalTime.format(DateTimeFormatter.ofPattern("mm")) : "N/A";
    }
}
