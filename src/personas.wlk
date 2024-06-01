class Persona{
	const property enfermedades = #{} //menos de 5
	var property temp; //maximo 45°	
	var property celulas;
	
	method enfermedades()=enfermedades
	method contraerEnfermedad(enfermedad){
		enfermedades.add(enfermedad)	
	}
	method vivirUnDia(){
		enfermedades.forEach({e=>e.efecto(self)})
	}
	method cantCelulasAgresivas(){
		return enfermedades.filter({e=>e.esAgresiva(self)})
					.sum({s=>s.celulasAmenazadas()})
	}
	method enfermedadFuerte(){
		return enfermedades.max({e=>e.celulasAmenazadas()})
	}
	method estaEnComa(){
		return temp==45||celulas<1000000
	}
	method recibirMedicamento(dosis){
		enfermedades.forEach({e=>e.atenuar(dosis*15)})
	}
}

class Medico inherits Persona{
	method atenderPersona(persona,dosis){
		persona.recibirMedicamento(dosis)
	}
	
}