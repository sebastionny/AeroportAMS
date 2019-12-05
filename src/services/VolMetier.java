package services;

import java.util.List;

import dao.Vol;

public interface VolMetier {

	public List<Vol> getAllVols();
	public List<Vol> getVolByNumVol(String id);
	public List<Vol> getVolByComp(String comp);
	public List<Vol> getVolByDepartVol();
	public List<Vol> getVolByArriveVol();
	public List<Vol> getVolByAujVol();
	public List<Vol> getVolByDemainVol();

}
