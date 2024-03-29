1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`id` AS id_studente, `degrees`.name AS corso
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";


2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT `degrees`.`name` AS nome_corso, `departments`.`name` AS nome_dipartimento, `degrees`.`level` AS livello_corso
FROM `departments`
JOIN `degrees`
ON `departments`.`id`=`degrees`.`department_id`
WHERE `degrees`.`level`="magistrale"
HAVING `departments`.`name`="Dipartimento di Neuroscienze";

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.`name` AS nome_corso, `teachers`.`name` AS nome_insegnante
FROM `courses`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`name`="Fulvio" AND `teachers`.`surname`="Amato";


4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname` AS cognome, `students`.`name` AS nome, `degrees`.`name` AS corso, `departments`.`name`
FROM `students`
JOIN `degrees` ON `students`.`degree_id`=`degrees`.`id`
JOIN `departments`ON `degrees`.`department_id`=`departments`.`id`
ORDER BY cognome, nome;

5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`name` AS corso_di_laurea, `courses`.`name` AS nomi_corsi, `teachers`.`name` AS nome_insegnante, `teachers`.`surname` AS cognome_insegnante
FROM `degrees`
JOIN `courses` ON `degrees`.`id`=`courses`.`degree_id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
ORDER BY corso_di_laurea;

6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.`name` AS nome, `teachers`.`surname` AS cognome, `departments`.`name` AS dipartimento 
FROM `teachers`
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees` ON `courses`.`degree_id`=`degrees`.`id`
JOIN `departments` ON `degrees`.`department_id`=`departments`.`id`
WHERE `departments`.`name`="Dipartimento di Matematica";

7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
superare ciascuno dei suoi esami


SELECT s.`name`, s.`surname`, c.`name` COUNT(es.`vote`) AS 'numero_di_tentetivi', MAX(es.`vote`) AS `voto_massimo`
FROM `student` AS s
JOIN `exam_student` AS es
ON s.`id` = es.`student_id`
JOIN `exams` AS e
ON e.`id` = es.`exam_id`
JOIN `courses` AS c
ON c.`id` = e.`couses.id`
GROUP BY s.`id` , c.`id`
HAVING `voto_massimo` >= 18
ORDER BY s.`surname`, s.`name`