package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Medicamento;

public class MedicamentoRepository {

  private static List<Medicamento> medicamentos = new ArrayList<>();

  public static void add(Medicamento medicamento) {
    medicamentos.add(medicamento);
  }

  public static void remove(Medicamento medicamento) {
    medicamentos.remove(medicamento);
  }

  public static void update(Medicamento medicamento) {
    for (Medicamento m : medicamentos) {
      if (m.getCodigo() == medicamento.getCodigo()) {
        m.setNome(medicamento.getNome());
        m.setDosagem(medicamento.getDosagem());
        m.setTipoDosagem(medicamento.getTipoDosagem());
        m.setDescricao(medicamento.getDescricao());
        m.setObservacao(medicamento.getObservacao());
        return;
      }
    }
  }

  public static List<Medicamento> getAll() {
    return new ArrayList<>(medicamentos);
  }

  public static Medicamento getOne(int codigo) {
    for (Medicamento m : medicamentos) {
      if (m.getCodigo() == codigo) {
        return m;
      }
    }
    return null;
  }
}