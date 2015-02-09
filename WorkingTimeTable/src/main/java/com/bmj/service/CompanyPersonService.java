package com.bmj.service;

import com.bmj.entity.CompanyPerson;


public interface CompanyPersonService {
	int insertCompanyPerson(CompanyPerson companyperson);
	CompanyPerson selectCompanyCodeByUserId(String userId);
}
