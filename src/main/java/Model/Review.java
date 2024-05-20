package Model;

public class Review {
	  private int id;
	    private int userId;
	    private String userName;
	    private String userEmail;
	    private String reviewContent;

	    public Review(int id, int userId, String userName, String userEmail, String reviewContent) {
	        this.id = id;
	        this.userId = userId;
	        this.userName = userName;
	        this.userEmail = userEmail;
	        this.reviewContent = reviewContent;
	    }

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getUserEmail() {
			return userEmail;
		}

		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}

		public String getReviewContent() {
			return reviewContent;
		}

		public void setReviewContent(String reviewContent) {
			this.reviewContent = reviewContent;
		}
	    
	    

}
