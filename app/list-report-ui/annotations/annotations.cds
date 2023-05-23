using PersonnelManagement as service from '../../../srv/data-provider';

//------------------------------------------------ Label Section ---------------------------------------------------------
annotate service.Personnels with {
    personnelNo  @Common.Label: '{i18n>personnelNo}';
    firstName    @Common.Label: '{i18n>firstName}';
    lastName     @Common.Label: '{i18n>lastName}';
    birthDate    @Common.Label: '{i18n>birthDate}';
    birthCountry @Common.Label: '{i18n>birthCountry}';
    birthCity    @Common.Label: '{i18n>birthCity}';
    departmentID @Common.Label: '{i18n>departmentID}';
    companyCode  @Common.Label: '{i18n>companyCode}';
};

annotate service.Departments with {
    ID             @Common.Label: '{i18n>departmentID}';
    name           @Common.Label: '{i18n>departmentName}';
    totalPersonnel @Common.Label: '{i18n>totalPersonnel}';
};

annotate service.Companies with {
    companyCode    @Common.Label: '{i18n>companyCode}';
    name           @Common.Label: '{i18n>companyName}';
    totalPersonnel @Common.Label: '{i18n>totalPersonnel}';
};

annotate service.PersonnelProjects with {
    personnelNo @Common.Label: '{i18n>personnelNo}';
    projectID   @Common.Label: '{i18n>projectID}';
};

annotate service.Projects with {
    ID   @Common.Label: '{i18n>projectID}';
    name @Common.Label: '{i18n>projectName}';
};

//------------------------------------- Selection Fields - Line Items Section --------------------------------------------
annotate service.Personnels with @(UI: {
    SelectionFields: [
        personnelNo,
        departmentID,
        companyCode
    ],
    LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: personnelNo
        },
        {
            $Type: 'UI.DataField',
            Value: firstName
        },
        {
            $Type: 'UI.DataField',
            Value: lastName
        },
        {
            $Type: 'UI.DataField',
            Value: birthDate
        },
        {
            $Type: 'UI.DataField',
            Value: birthCity
        },
        {
            $Type: 'UI.DataField',
            Value: birthCountry
        },
        {
            $Type: 'UI.DataField',
            Value: toDepartment.name
        },
        {
            $Type: 'UI.DataField',
            Value: toCompany.name
        }
    ]
});

annotate service.PersonnelProjects with @(UI:{
    SelectionFields  : [
        projectID
    ],
    LineItem : [
        {
            $Type: 'UI.DataField',
            Value: personnelNo
        },
        {
            $Type: 'UI.DataField',
            Value: projectID
        },
        {
            $Type: 'UI.DataField',
            Value: toProjects.name
        }
    ]
});

//--------------------------------------------- Object Page Section ------------------------------------------------------
annotate service.Personnels with @(UI:{
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : '{i18n>personnel}',
        TypeNamePlural : '{i18n>personnels}',
        Title : {
            $Type : 'UI.DataField',
            Value : {
                $edmJson : {
                    $Apply : [
                        {
                            $Path : 'personnelNo'
                        },
                        ' - ',
                        {
                            $Path : 'firstName'
                        },
                        ' ',
                        {
                            $Path : 'lastName'
                        }                                                
                    ],
                    $Function : 'odata.concat'
                }
            }
        },
        Description: {
            $Type : 'UI.DataField',
            Value : toDepartment.name
        },
        ImageUrl : 'https://cloudwuerdig.com/wp-content/uploads/2020/12/New-Project-9.png',
    },
    HeaderFacets  : [
        {
            $Type : 'UI.CollectionFacet',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#HeaderPersonalInfo',
                    Label : 'Personal Information'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#HeaderCompanyInfo',
                    Label : 'Company Information'
                }
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#HeaderBirthInfo',
            Label : 'Birth Information'
        }
    ],
    FieldGroup #HeaderPersonalInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : firstName
            },
            {
                $Type : 'UI.DataField',
                Value : lastName
            }
        ]
    },
    FieldGroup #HeaderCompanyInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : companyCode
            },
            {
                $Type : 'UI.DataField',
                Value : toCompany.name
            },
            {
                $Type : 'UI.DataField',
                Value : toDepartment.name
            }
        ]
    },
    FieldGroup #HeaderBirthInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : birthCity
            },
            {
                $Type : 'UI.DataField',
                Value : birthCountry
            },
            {
                $Type : 'UI.DataField',
                Value : birthDate
            }
        ]
    },
    Facets  : [
        {
            $Type : 'UI.CollectionFacet',
            Label: 'Personnel Information',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#PersonalInformation',
                    Label: 'Name - Surname'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#BirthInformation',
                    Label: 'Birth Information'
                }
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#CompanyInformation',
            Label : 'Company Information'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'toProjects/@UI.LineItem',
            Label : 'Projects'
        }
    ],
    FieldGroup #PersonalInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : firstName
            },
            {
                $Type : 'UI.DataField',
                Value : lastName
            }
        ]
    },
    FieldGroup #BirthInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : birthDate
            },
            {
                $Type : 'UI.DataField',
                Value : birthCountry
            },
            {
                $Type : 'UI.DataField',
                Value : birthCity
            }
        ]
    },
    FieldGroup #CompanyInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : companyCode
            },
            {
                $Type : 'UI.DataField',
                Value : toCompany.name
            },
            {
                $Type : 'UI.DataField',
                Value : departmentID
            },
            {
                $Type : 'UI.DataField',
                Value : toDepartment.name
            }
        ]
    }
});
