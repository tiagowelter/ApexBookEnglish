/*
Code execution example in Execute Anonymous:
        // Instantiating the car1 object
        CarV2 car1 = new CarV2 (50.0, 120);

        // Instantiating the car2 object
        CarV2 car2 = new CarV2 (40.0, 90);

        // Using the Car class methods
        car1.refuel(20.0);
        System.debug(car1.getFuel()); // 70.0

        car2.setSpeed(100);
        System.debug(car2.getSpeed()); // 100

        car1.drive(); // Driving at speed: 120
        car2.drive(); // Driving at speed: 100
*/
public class CarV2 {
    private decimal fuel;
    private Integer maxSpeed;

    public CarV2(decimal fuel, Integer maxSpeed) {
        this.fuel = fuel;
        this.maxSpeed = maxSpeed;
    }

    public void refuel(decimal fuelAmount) {
        fuel += fuelAmount;
    }

    public decimal getFuel() {
        return fuel;
    }

    public void setSpeed(Integer speed) {
        maxSpeed = speed;
    }

    public Integer getSpeed() {
        return maxSpeed;
    }

    public void drive() {
        System.debug('Driving at speed: ' + maxSpeed);
    }
}