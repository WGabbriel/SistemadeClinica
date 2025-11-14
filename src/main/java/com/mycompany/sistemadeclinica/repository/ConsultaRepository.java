package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Consulta;

public class ConsultaRepository {
  private static List<Consulta> consultas = new ArrayList<>();

  public static void add(Consulta consulta) {
    consultas.add(consulta);
  }

  public static void remove(Consulta consulta) {
    consultas.remove(consulta);
  }

  public static List<Consulta> findByPacienteCpf(String cpf) {
    List<Consulta> resultado = new ArrayList<>();
    for (Consulta c : consultas) {
      if (c.getPaciente().getCpf().equals(cpf)) {
        resultado.add(c);
      }
    }
    return resultado;
  }

  public static List<Consulta> findByMedicoCrm(String crm) {
    List<Consulta> resultado = new ArrayList<>();
    for (Consulta c : consultas) {
      if (c.getMedico().getCrm().equals(crm)) {
        resultado.add(c);
      }
    }
    return resultado;
  }
}
