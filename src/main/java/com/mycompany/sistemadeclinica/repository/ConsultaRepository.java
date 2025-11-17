package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Consulta;

public class ConsultaRepository {
  private static List<Consulta> consultas = new ArrayList<>();
  private static int nextCodigo = 1;

  static {
    Consulta c1 = new Consulta();
    c1.setCodigo(nextCodigo++);
    c1.setDataHora("2024-06-15");
    c1.setDataHoraVolta("2024-06-22");
    c1.setMedico(MedicoRepository.getOne("12345"));
    c1.setPaciente(PacienteRepository.getOne("12345678900"));
    consultas.add(c1);

    Consulta c2 = new Consulta();
    c2.setCodigo(nextCodigo++);
    c2.setDataHora("2024-06-16");
    c2.setDataHoraVolta("2024-06-23");
    c2.setMedico(MedicoRepository.getOne("67890"));
    c2.setPaciente(PacienteRepository.getOne("98765432100"));
    consultas.add(c2);
  }

  public static void add(Consulta consulta) {
    consulta.setCodigo(nextCodigo++);
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

  public static Consulta getOne(int codigo) {
    for (Consulta c : consultas) {
      if (c.getCodigo() == codigo) {
        return c;
      }
    }
    return null;
  }
}
