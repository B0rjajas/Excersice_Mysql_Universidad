Use Universidad;

-- Promedio de notas
SELECT Profesores.id_profesor, Profesores.nombre, AVG(Calificaciones.calificacion) AS promedio_calificacion
FROM Profesores
JOIN Calificaciones ON Profesores.id_profesor = Calificaciones.id_profesor
GROUP BY Profesores.id_profesor, Profesores.nombre;


-- Calificaciones
SELECT Estudiantes.nombre, MAX(Calificaciones.calificacion) AS mejor_calificacion
FROM Estudiantes
JOIN Calificaciones ON Estudiantes.id_estudiante = Calificaciones.id_estudiante
GROUP BY Estudiantes.id_estudiante, Estudiantes.nombre;

-- Ordenar estudiantes por cursos
SELECT Estudiantes.nombre, GROUP_CONCAT(Cursos.nombre SEPARATOR ', ') AS cursos_inscritos
FROM Estudiantes
JOIN Calificaciones ON Estudiantes.id_estudiante = Calificaciones.id_estudiante
JOIN Cursos ON Calificaciones.id_curso = Cursos.id_curso
GROUP BY Estudiantes.id_estudiante, Estudiantes.nombre
ORDER BY cursos_inscritos;


-- Crear un informe de loc cursos y sus calificaciones
SELECT Cursos.nombre AS curso, AVG(Calificaciones.calificacion) AS promedio_calificacion
FROM Cursos
JOIN Calificaciones ON Cursos.id_curso = Calificaciones.id_curso
GROUP BY Cursos.id_curso, Cursos.nombre
ORDER BY promedio_calificacion DESC;

-- cursos y sus calificaciones promedio, ordenados por el curso más desafiante
SELECT Cursos.nombre AS curso, AVG(Calificaciones.calificacion) AS promedio_calificacion
FROM Cursos
JOIN Calificaciones ON Cursos.id_curso = Calificaciones.id_curso
GROUP BY Cursos.id_curso, Cursos.nombre
ORDER BY promedio_calificacion ASC;


-- estudiante y profesor tienen la mayor cantidad de cursos en común
SELECT Estudiantes.nombre AS estudiante, Profesores.nombre AS profesor, COUNT(*) AS cantidad_cursos_comunes
FROM Estudiantes
JOIN Calificaciones ON Estudiantes.id_estudiante = Calificaciones.id_estudiante
JOIN Profesores ON Calificaciones.id_profesor = Profesores.id_profesor
GROUP BY Estudiantes.id_estudiante, Profesores.id_profesor
HAVING COUNT(*) > 0
ORDER BY cantidad_cursos_comunes DESC
LIMIT 1;


