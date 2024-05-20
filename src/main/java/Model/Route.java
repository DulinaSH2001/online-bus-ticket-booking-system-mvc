package Model;

public class Route {

	 private int id;
	    private String fromLocation;
	    private String toLocation;
	    private String startTime;
	    private String finishTime;
	    private String routeNumber;
	    private String busRegNum;
	    private int availability;
	    private double price;
	    private int seats;
	    private int airConditioned;

	    // Constructor
	    public Route(int id, String fromLocation, String toLocation, String startTime, String finishTime, 
	                 String routeNumber, int availability, double price, int seats, int airConditioned,String busRegNum ) {
	        this.id = id;
	        this.fromLocation = fromLocation;
	        this.toLocation = toLocation;
	        this.startTime = startTime;
	        this.finishTime = finishTime;
	        this.routeNumber = routeNumber;
	        this.availability = availability;
	        this.price = price;
	        this.seats = seats;
	        this.airConditioned = airConditioned;
	        this.busRegNum =busRegNum;
	    }

	    // Getters and Setters
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getFromLocation() {
	        return fromLocation;
	    }

	    public void setFromLocation(String fromLocation) {
	        this.fromLocation = fromLocation;
	    }

	    public String getToLocation() {
	        return toLocation;
	    }

	    public void setToLocation(String toLocation) {
	        this.toLocation = toLocation;
	    }

	    public String getStartTime() {
	        return startTime;
	    }

	    public void setStartTime(String startTime) {
	        this.startTime = startTime;
	    }

	    public String getFinishTime() {
	        return finishTime;
	    }

	    public void setFinishTime(String finishTime) {
	        this.finishTime = finishTime;
	    }

	    public String getRouteNumber() {
	        return routeNumber;
	    }

	    public void setRouteNumber(String routeNumber) {
	        this.routeNumber = routeNumber;
	    }

	    public int getAvailability() {
	        return availability;
	    }

	    public void setAvailability(int availability) {
	        this.availability = availability;
	    }

	    public double getPrice() {
	        return price;
	    }

	    public void setPrice(double price) {
	        this.price = price;
	    }

	    public int getSeats() {
	        return seats;
	    }

	    public void setSeats(int seats) {
	        this.seats = seats;
	    }

	    public int isAirConditioned() {
	        return airConditioned;
	    }

	    public void setAirConditioned(int airConditioned) {
	        this.airConditioned = airConditioned;
	    }

		public String getBusRegNum() {
			return busRegNum;
		}

		public void setBusRegNum(String busRegNum) {
			this.busRegNum = busRegNum;
		}
	    
	}
