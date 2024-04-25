use alumnes;
select alumnos.nombre, alumnos.apellido1, alumnos.apellido2, alumnos.parcial1
from alumnos 
where alumnos.parcial1 > (
select avg(alumnos.parcial1)
from alumnos
);
select alumnos.nombre, alumnos.apellido1, alumnos.apellido2, alumnos.parcial1
from alumnos 
where alumnos.edad > (
select alumnos.edad
from alumnos
where alumnos.practicas = (
select max(alumnos.practicas)
from alumnos
)
);
select alumnos.nombre
from alumnos
where alumnos.nombre = any (
select profesores.nombre
from profesores
);
select alumnos.nombre, alumnos.apellido1
from alumnos
inner join profesores on alumnos.dniprof = profesores.dni
where profesores.nombre= 'Carlos';

select alumnos.nombre, alumnos.apellido1
from alumnos
inner join profesores on alumnos.dniprof = profesores.dni
where profesores.nombre= (
select profesores.nombre
from profesores
where profesores.nombre='Carlos'
);
SELECT DISTINCT alumnos.nombre, alumnos.apellido1, alumnos.apellido2
FROM alumnos
WHERE alumnos.dni IN (
    SELECT DISTINCT alumnos.dni
    FROM alumnos
    WHERE alumnos.dniprof IN (
        SELECT profesores.dni
        FROM profesores
        WHERE EXISTS (
            SELECT *
            FROM alumnos
            WHERE alumnos.dniprof = profesores.dni
            AND alumnos.practicas < 5 
        )
    )
);
select profesores.nombre
from profesores
where exists (
	select *
    from profesores
    inner join alumnos on alumnos.dniprof = profesores.dni
    where alumnos.edad > 18
    );


