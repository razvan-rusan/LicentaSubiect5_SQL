create table joi_prep.Student(
    Id_Student int not null primary key identity,
    Nume nvarchar(30),
    Specializare nvarchar(30),
    An int
)

create table joi_prep.Curs(
    Id_Curs int not null primary key identity,
    Denumire nvarchar(30),
    Credite int
)

create table joi_prep.Stud_Curs(
    Id_Student int not null foreign key references joi_prep.Student(Id_Student),
    Id_Curs int not null foreign key references joi_prep.Curs(Id_Curs),
    Nota int,
    constraint stud_curs_pk primary key (Id_Student, Id_Curs)
)