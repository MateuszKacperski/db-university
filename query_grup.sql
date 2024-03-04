--1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(`enrolment_date`) as anno_universitario, COUNT(*) as numero_inscrizioni
FROM `students`
GROUP BY YEAR(`enrolment_date`);

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT `office_address` as indirizzo_ufficio, COUNT(*) as numero_inseganti
FROM `teachers`
GROUP BY `office_address`;
HAVING `numero_insegnanti` > 1;


--3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id` as appello_esame, ROUND(AVG(`vote`)) as media_voto
FROM `exam_student`
GROUP BY appello_esame;


--4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id` as numero_dipartimento, COUNT(*) as numero_corsi
FROM `degrees`
GROUP BY numero_dipartimento;
