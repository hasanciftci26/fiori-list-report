using Personnels as Pers from '../db/data-models';

service PersonnelManagement {
    entity Personnels as projection on Pers;
};
