package Model;

public class Complaint {
	private String fullName;
    private String email;
    private String complaint;
    private String c_status;

    public Complaint(String fullName, String email, String complaint,String c_status) {
        this.fullName = fullName;
        this.email = email;
        this.complaint = complaint;
        this.c_status =c_status;
    }

    // Getters and setters
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComplaint() {
        return complaint;
    }

    public void setComplaint(String complaint) {
        this.complaint = complaint;
    }

	public String getC_status() {
		return c_status;
	}

	public void setC_status(String c_status) {
		this.c_status = c_status;
	}
    
}


