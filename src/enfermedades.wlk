import personas.*

class Enfermedad{
	var property celulasAmenazadas;
	method efecto(persona);
	method esAgresiva(persona);
	method atenuar(){}
}

class EnfermedadInfecciosa inherits Enfermedad{
	override method efecto(persona){
		persona.temp(45.min(persona.temp()+celulasAmenazadas/1000))
	}
	override method esAgresiva(persona){
		return celulasAmenazadas>persona.celulas()*0.1
	}
	method reproducirse(){
		celulasAmenazadas = celulasAmenazadas*2
	}	
}

class EnfermedadAutoinmune inherits Enfermedad{
	override method efecto(persona){
		persona.celulas(persona.celulas()-celulasAmenazadas)
	}
	override method esAgresiva(persona){
		return false//persona.cantDias()>30
	}
}