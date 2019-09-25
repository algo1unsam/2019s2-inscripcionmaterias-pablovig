class Alumno {
	
	var carreras = #{}
	
	var materiasIns = #{}
	
	var materiasAp = #{}
	
	method correspondeMateria(materia){
		return carreras.contains(materia.carrera())
	}
	
	method puedeAnotarse(materia){return !materiasIns.contains(materia) and
			!materiasAp.contains(materia)}
	
	method inscripcionMateria(materia){
		if (self.puedeAnotarse(materia))
		materiasIns.add(materia)
	}
	
	method materiaAprob(materia){materiasAp.contains(materia)}
	
	method creditosAcum(){
		return materiasAp.sum({materia => materia.credito()})
	}
	
	method registrarMateriaAprob(materia){materiasAp.add{materia}}
	
}

class Materia{
	
	var property carrera
	
	var property credito=10
	
	var property anio=0
	
	var property prerrequisito
	
	var alumnosIns = #{}
	
	var alumnosEsp = #{}
	
	method correspondeCarrera(ingCarrera){carrera=ingCarrera}
	
	method carrera(){return carrera}
	
	method valorCredito(){return credito}
	
	method cumpleConPre(alumno){return prerrequisito.cumplePre(alumno)}
	
	method inscrpcionAlumno(alumno){
		if (self.cumpleConPre(alumno))alumnosIns.add(alumno)
			else alumnosEsp.add(alumno)
	}
	
	method autoInscripcion(){if (alumnosEsp.size()>0) alumnosIns.add(alumnosEsp.first()) }
	
	method sacarAlumno(alumno){
		alumnosIns.remove(alumno)
		self.autoInscripcion()
	}
	
}

class MateriasCorrelativas {
	
	var correlativas = #{}
	
	method cumplePre(alumno){
		correlativas.all({ materia =>  alumno.materiaAprob(materia)})
	}
	
}

class CantidadCreditos {
	
	var property creditosN=250
	
	method cumplePre (alumno){
		return creditosN<alumno.creditosAcum()
	}
	
}

class MateriasPorAnio {
	
	var materiaI
	
	var anio

	
	method queMateria(mat){materiaI=mat}
	
	method datosDeMateria(){
		
		anio=materiaI.anio()
		
		}
	
	method cumplePre(alumno){
		
		self.datosDeMateria()
		materiaI.carrera().materiasNecesarias(anio).all({materia => alumno.materiaAprob(materia)})

		
	}
		
	
}

object nada{
	method cumplePre(alumno){return 0}
}

class Carrera{
	
	var property materias = #{}
	
		method agregarMateria(materia){materias.add(materia)}
		
		method materiasNecesarias(anio){materias.filter({materia => materia.anio()== anio-1})}
				
}