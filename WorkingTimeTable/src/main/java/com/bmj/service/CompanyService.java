package com.bmj.service;

import com.bmj.entity.Company;

public interface CompanyService {
	int insertCompany(Company company);
	Company seelctCompany(Company company);
	Company selectCompanyByCompanyCode(int companyCode);
}
