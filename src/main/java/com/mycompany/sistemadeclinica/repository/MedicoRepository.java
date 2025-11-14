package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Medico;

public class MedicoRepository {

  private static List<Medico> medicos = new ArrayList<>();

  static {
    Medico m = new Medico();
    m.setCrm("12345");
    m.setNome("Dr. João Silva");
    m.setEspecialidade("Cardiologia");
    m.setContato("(11) 98765-4321");
    m.setPassword("123");
    medicos.add(m);

    Medico m2 = new Medico();
    m2.setCrm("67890");
    m2.setNome("Dra. Maria Oliveira");
    m2.setEspecialidade("Dermatologia");
    m2.setContato("(21) 91234-5678");
    m2.setPassword("456");
    medicos.add(m2);

  }

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

  public static Medico login(String crm, String password) {

    for (Medico m : medicos) {
      if (m.getCrm().equals(crm) && m.getPassword().equals(password)) {
        return m;
      }
    }
    return null;
  }

  public static void alterarSenha(String crm, String password) {

    for (Medico mAux : medicos) {
      if (mAux.getCrm().equals(crm)) {
        mAux.setPassword(password);
        return;
      }
    }
  }
}