-- a. lista tuturor studentilor de la specializarea informatica
select Nume from joi_prep.Student where Specializare = 'informatica'

-- b. lista cursurilor cu mai mult de 10 inscrisi
select Curs.Denumire from joi_prep.Stud_Curs
inner join joi_prep.Curs
on Stud_Curs.Id_Curs = Curs.Id_Curs
group by Curs.Denumire
having count(distinct Id_Student) > 10

-- c. pentru fiecare student determinati nr de cursuri la care este inscris
select Nume, count(distinct Id_Curs) as Nr_Cursuri from joi_prep.Student
inner join joi_prep.Stud_Curs
on Student.Id_Student = Stud_Curs.Id_Student
group by Nume

-- d. determinati media notelor de la fiecare curs
select Denumire, cast(avg(cast(Nota as float)) as decimal(3,2)) as Media_Notelor from joi_prep.Stud_Curs
inner join joi_prep.Curs
on Stud_Curs.Id_Curs = Curs.Id_Curs
group by Denumire

-- e. lista studentilor pentru care toate cursurile pe care le urmeaza au cel putin 3 credite
select Nume, min(Credite) as Credite from joi_prep.Stud_Curs
inner join joi_prep.Student
on Stud_Curs.Id_Student = Student.Id_Student
inner join joi_prep.Curs
on Stud_Curs.Id_Curs = Curs.Id_Curs
group by Nume
having min(Credite) >= 3
-- daca minimul dintre credite e cel putin 3,
-- inseamna ca toate cursurile
-- au nr de credite >= cu 3

-- f. actualizarea notei studentului cu Id_Student = 123
-- la cursul cu Id_Curs = STII03
-- la valoarea 9

-- Observatie: o cheie primara nu poate fi decat int, bigint, tinyint etc. deci
-- va trebui sa tinim in schimb dupa un curs cu un id cunoscut, la noi Id_Curs = 7
update joi_prep.Stud_Curs
set nota = 9
where Id_Student = 123 and Id_Curs = 7