package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Medico;

public class MedicoRepository {

  private static List<Medico> medicos = new ArrayList<>();

  public static void add(Medico medico) {
    medicos.add(medico);
  }

  public static void remove(Medico medico) {
    medicos.remove(medico);
  }

  public static void update(Medico medico) {
    for (Medico m : medicos) {
      if (m.getCrm().equals(medico.getCrm())) {
        m.setNome(medico.getNome());
        m.setEspecialidade(medico.getEspecialidade());
        m.setContato(medico.getContato());
        return;
      }
    }
  }

  public static List<Medico> getAll() {
    return new ArrayList<>(medicos);
  }

  public static Medico getOne(String crm) {
    for (Medico m : medicos) {
      if (m.getCrm().equals(crm)) {
        return m;
      }
    }
    return null;
  }
}