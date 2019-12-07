package dao;

public class User {
	private String usager;
	private String motdepasse;
	public String getUsager() {
		return usager;
	}
	public void setUsager(String usager) {
		this.usager = usager;
	}
	public String getMotdepasse() {
		return motdepasse;
	}
	public void setMotdepasse(String motdepasse) {
		this.motdepasse = motdepasse;
	}
	
	public User(String usager, String motdepasse) {
		super();
		this.usager = usager;
		this.motdepasse = motdepasse;
	}
	
	public User() {
		
	}
	
}
