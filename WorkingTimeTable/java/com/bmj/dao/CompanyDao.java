package com.bmj.dao;

import com.bmj.entity.Company;

public interface CompanyDao {
	int insert(Company company);
	Company select(Company company);
	Company selectByCompanyCode(int companyCode);
}
