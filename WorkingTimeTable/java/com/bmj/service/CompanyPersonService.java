package com.bmj.service;

import java.util.List;

import com.bmj.entity.CompanyPerson;


public interface CompanyPersonService {
	int insertCompanyOwner(CompanyPerson companyperson);
	int insertCompanyEmployee(CompanyPerson companyperson);
	
	int insertCompanyPerson(CompanyPerson companyperson);
	
	CompanyPerson selectCompanyPersonByUserId(String userId);
	int selectComCodeByUserId(String userId);
	List<CompanyPerson> selectByCompanyCode(int companyCode);
}
