import java.sql.Date;

public class Createpojo {
	String company_Name;
	int resources;
	int experience;
	
	int ctc;
	int position;
	int joiningc;
	int educationc;
	String followup;
	float bond;
	public String getCompany_Name() {
		return company_Name;
	}
	public void setCompany_name(String company_name) {
		this.company_Name = company_Name;
	}
	public int getResources() {
		return resources;
	}
	public void setResources(int resources) {
		this.resources = resources;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public int getCtc() {
		return ctc;
	}
	public void setCtc(int ctc) {
		this.ctc = ctc;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getJoiningc() {
		return joiningc;
	}
	public void setJoiningc(int joiningc) {
		this.joiningc = joiningc;
	}
	public int getEducationc() {
		return educationc;
	}
	public void setEducationc(int educationc) {
		this.educationc = educationc;
	}
	public String getFollowup() {
		return followup;
	}
	public void setFollowup(String followup) {
		this.followup = followup;
	}
	public float getBond() {
		return bond;
	}
	public void setBond(float bond) {
		this.bond = bond;
	}
	@Override
	public String toString() {
		return "Createpojo [company_name=" + company_Name + ", resources=" + resources + ", experience=" + experience
				+ ", ctc=" + ctc + ", position=" + position + ", joiningc=" + joiningc + ", educationc=" + educationc
				+ ", followup=" + followup + ", bond=" + bond + "]";
	}
	

}
