package com.bmj.service;

import java.util.List;

import com.bmj.entity.CompanyPerson;


public interface CompanyPersonService {
	int insertCompanyPerson(CompanyPerson companyperson);
	CompanyPerson selectCompanyCodeByUserId(String userId);
	List<CompanyPerson> selectByCompanyCode(int companyCode);
}
