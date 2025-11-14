package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Paciente;

public class PacienteRepository {
  private static List<Paciente> pacientes = new ArrayList<>();

  static {
    Paciente p1 = new Paciente();
    p1.setCpf("12345678900");
    p1.setNome("Ana Silva");
    p1.setContato("(11) 91234-5678");
    p1.setEndereco("Rua A, 123, São Paulo, SP");
    p1.setPlanoSaude("Plano X");
    pacientes.add(p1);

    Paciente p2 = new Paciente();
    p2.setCpf("98765432100");
    p2.setNome("Bruno Souza");
    p2.setContato("(21) 99876-5432");
    p2.setEndereco("Avenida B, 456, Rio de Janeiro, RJ");
    p2.setPlanoSaude("Plano Y");
    pacientes.add(p2);

  }

  public static void add(Paciente paciente) {
    pacientes.add(paciente);
  }

  public static void remove(Paciente paciente) {
    pacientes.remove(paciente);
  }

  public static void update(Paciente paciente) {
    for (Paciente p : pacientes) {
      if (p.getCpf().equals(paciente.getCpf())) {
        p.setNome(paciente.getNome());
        p.setContato(paciente.getContato());
        p.setEndereco(paciente.getEndereco());
        p.setPlanoSaude(paciente.getPlanoSaude());
        return;
      }
    }
  }

  public static List<Paciente> getAll() {
    return new ArrayList<>(pacientes);
  }

  public static Paciente getOne(String cpf) {
    for (Paciente p : pacientes) {
      if (p.getCpf().equals(cpf)) {
        return p;
      }
    }
    return null;
  }
}
