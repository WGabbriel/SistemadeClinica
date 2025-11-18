package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Consulta;
import com.mycompany.sistemadeclinica.models.Prontuario;

public class ProntuarioRepository {

  private static List<Prontuario> prontuarios = new ArrayList<>();

  public static void add(Prontuario prontuario) {
    Consulta consulta = prontuario.getConsulta();
    consulta.setProntuario(prontuario);
    prontuarios.add(prontuario);
  }

  public static void remove(Prontuario prontuario) {
    prontuarios.remove(prontuario);
  }
}