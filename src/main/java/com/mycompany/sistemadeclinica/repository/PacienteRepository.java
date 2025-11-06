package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Paciente;

public class PacienteRepository {
  private static List<Paciente> pacientes = new ArrayList<>();

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
