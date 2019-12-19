package dao;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

public class volajour implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String numVol;
	private Date dateVol;
	private String heureEstime;
	private String statutChange;
	public String getNumVol() {
		return numVol;
	}
	public void setNumVol(String numVol) {
		this.numVol = numVol;
	}
	public Date getDateVol() {
		return dateVol;
	}
	public void setDateVol(Date dateVol) {
		this.dateVol = dateVol;
	}
	public String getHeureEstime() {
		return heureEstime;
	}
	public void setHeureEstime(String heureEstime) {
		this.heureEstime = heureEstime;
	}
	public String getStatutChange() {
		return statutChange;
	}
	public void setStatutChange(String statutChange) {
		this.statutChange = statutChange;
	}
	public volajour(String numVol, Date dateVol, String heureEstime, String statutChange) {
		super();
		this.numVol = numVol;
		this.dateVol = dateVol;
		this.heureEstime = heureEstime;
		this.statutChange = statutChange;
	}
	public volajour() {}
	
	
	

}
