package com.bmj.dao;

import java.util.List;

import com.bmj.entity.CompanyPerson;

public interface CompanyPersonDao {
	int insertCompanyPerson(CompanyPerson companyperson);
	CompanyPerson selectCompanyCodeByUserId(String userId);
	List<CompanyPerson> selectByCompanyCode(int companyCode);
}
