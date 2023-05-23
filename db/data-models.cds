entity Personnels {
    key personnelNo  : Integer;
        firstName    : String(40);
        lastName     : String(40);
        birthDate    : Date;
        birthCity    : String(50);
        birthCountry : String(50);
        departmentID : UUID;
        companyCode  : String(4);
        toDepartment : Association to Departments
                           on toDepartment.ID = $self.departmentID;
        toCompany    : Association to Companies
                           on toCompany.companyCode = $self.companyCode;
        toProjects   : Association to many PersonnelProjects
                           on toProjects.toPersonnels = $self;
};

@cds.autoexpose
entity Departments {
    key ID             : UUID;
        name           : String(100);
        companyCode    : String(4);
        totalPersonnel : Integer;
        toPersonnels   : Association to many Personnels
                             on toPersonnels.toDepartment = $self;
        toCompany      : Association to Companies
                             on toCompany.companyCode = $self.companyCode;
};

@cds.autoexpose
entity Companies {
    key companyCode    : String(4);
        name           : String(100);
        totalPersonnel : Integer;
        toPersonnels   : Association to many Personnels
                             on toPersonnels.toCompany = $self;
        toDepartments  : Association to many Departments
                             on toDepartments.toCompany = $self;
};

@cds.autoexpose
entity Projects {
    key ID           : UUID;
        name         : String(100);
        toPersonnels : Association to many PersonnelProjects
                           on toPersonnels.toProjects = $self;
};

@cds.autoexpose
entity PersonnelProjects {
    key personnelNo  : Personnels:personnelNo;
    key projectID    : Projects:ID;
        toPersonnels : Association to Personnels
                           on toPersonnels.personnelNo = $self.personnelNo;
        toProjects   : Association to Projects
                           on toProjects.ID = $self.projectID;
};
