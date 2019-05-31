package Model;

import java.io.Serializable;

/**
 *
 * @author Patricia Ann Acosta
 */

public class User implements Serializable {

    
    private String FullName;   
    private String PhoneNumber;   
    private String Username;
    private String Password;
    private String Status;
    private String Role;
    public boolean valid;

    public User() {
        }
         
	
	public User(String FullName,String PhoneNumber, String Username, String Password, String Status, String Role) {
	this.FullName = FullName;
        this.PhoneNumber = PhoneNumber;
        this.Username = Username;
        this.Password = Password;
        this.Status = Status;        
        this.Role = Role;
	}
        
        public User(String Username) {
        this.Username = Username;
    }
 
    public User(String FullName,String PhoneNumber,String Password, String Status, String Role) {
	this.FullName = FullName;
        this.PhoneNumber = PhoneNumber;
        this.Password = Password;
        this.Status = Status;        
        this.Role = Role;
    }
        

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }
        
        public String getFullName() {
		return FullName;
	}
        
        public boolean hasFullName(String FullName) {
		return getFullName().equals(FullName.toUpperCase());
	}
        
        public String getPhoneNumber() {
		return PhoneNumber;
	}
        
        public boolean hasPhoneNumber(String PhoneNumber) {
		return getPhoneNumber().equals(PhoneNumber.toUpperCase());
	}
	
        
        public String getUsername() {
		return Username;
	}
        
	public String getPassword() {
		return Password;
	}
	                
        public String getStatus() {
		return Status;
	}
	   
        public String getRole() {
		return Role;
	}
        
        public boolean isValid() {
         return valid;
	}

        public void setValid(boolean newValid) {
         valid = newValid;
	}	
      
        private String maskPass(String password) {
        String output = "";
        for(int i = 0; i < password.length(); i++) {
            output += "\u2022";
        }
        return output;
        }    
         
}