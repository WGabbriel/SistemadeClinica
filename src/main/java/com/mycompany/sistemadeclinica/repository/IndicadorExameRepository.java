package com.mycompany.sistemadeclinica.repository;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.sistemadeclinica.models.IndicadorExame;

public class IndicadorExameRepository {

  private static List<IndicadorExame> indicadores = new ArrayList<>();

  public static void add(IndicadorExame indicador) {
    indicadores.add(indicador);
  }

  public static void remove(IndicadorExame indicador) {
    indicadores.remove(indicador);
  }

  public static void update(IndicadorExame indicadorExame) {
    for (IndicadorExame i : indicadores) {
      if (i.getCodigo() == indicadorExame.getCodigo()) {
        i.setIndicador(indicadorExame.getIndicador());
        i.setDescricao(indicadorExame.getDescricao());
        i.setMinValorReferencia(indicadorExame.getMinValorReferencia());
        i.setMaxValorReferencia(indicadorExame.getMaxValorReferencia());
        return;
      }
    }
  }

  public static List<IndicadorExame> getAll() {
    return new ArrayList<>(indicadores);
  }

  public static IndicadorExame getOne(int codigo) {
    for (IndicadorExame i : indicadores) {
      if (i.getCodigo() == codigo) {
        return i;
      }
    }
    return null;
  }

}