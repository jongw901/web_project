package com.home.vo;

public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String keyword = "";
	private String home = "n";
	private String memberwritelist = "n";
	
	
	

	public String getMemberwritelist() {
		return memberwritelist;
	}
	public void setMemberwritelist(String memberwritelist) {
		this.memberwritelist = memberwritelist;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}