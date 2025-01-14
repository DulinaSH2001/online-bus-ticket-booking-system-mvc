package Model;

public class User {
	
	 private int id;
	    private String username;
	    private String password;
	    private String email;
	    private String name;
	    private String phoneNumber;
	    private String nic;

	    public User(int id, String username, String password, String email, String name, String phoneNumber,String nic) {
	        this.id = id;
	        this.username = username;
	        this.password = password;
	        this.email = email;
	        this.name = name;
	        this.phoneNumber = phoneNumber;
	        this.nic =nic;
	    }

	    // Getters and setters for the fields
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getUsername() {
	        return username;
	    }

	    public void setUsername(String username) {
	        this.username = username;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getPhoneNumber() {
	        return phoneNumber;
	    }

	    public void setPhoneNumber(String phoneNumber) {
	        this.phoneNumber = phoneNumber;
	    }
	    public String getNic() {
	        return nic;
	    }

	    public void setNic(String nic) {
	        this.nic = nic;
	    }
	}