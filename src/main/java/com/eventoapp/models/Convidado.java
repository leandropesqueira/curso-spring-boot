package com.eventoapp.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Convidado {
	
	@Id
	private String rg;
	private String nomeConvidado;
	
	@ManyToOne
	private Evento evento;

}
