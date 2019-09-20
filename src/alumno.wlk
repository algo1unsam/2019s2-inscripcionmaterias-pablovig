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
	
	method correlativasAprob(materia){materiasAp.contains(materia)}
	
	
	
}

class Materia{
	
	var property carrera
	
	var property credito=10
	
	method correspondeCarrera(ingCarrera){carrera=ingCarrera}
	
	method carrera(){return carrera}
	
	method valorCredito(){return credito}
}

class MateriasCorrelativas {
	
	var correlativas = #{}
	
	method cumplePre(alumno){
		correlativas.all({ materia =>  alumno.correlativasAprob(materia)})
	}
	
}

class CantidadCreditos {
	
	var property creditosN
	
	method cumplePre (){
		
	}
	
}