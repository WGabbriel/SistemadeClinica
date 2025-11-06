package com.mycompany.sistemadeclinica.models;

public class IndicadorExame {

  private int codigo;
  private String indicador;
  private String descricao;
  private String minValorReferencia;
  private String maxValorReferencia;

  public int getCodigo() {
    return codigo;
  }

  public void setCodigo(int codigo) {
    this.codigo = codigo;
  }

  public String getIndicador() {
    return indicador;
  }

  public void setIndicador(String indicador) {
    this.indicador = indicador;
  }

  public String getDescricao() {
    return descricao;
  }

  public void setDescricao(String descricao) {
    this.descricao = descricao;
  }

  public String getMinValorReferencia() {
    return minValorReferencia;
  }

  public void setMinValorReferencia(String minValorReferencia) {
    this.minValorReferencia = minValorReferencia;
  }

  public String getMaxValorReferencia() {
    return maxValorReferencia;
  }

  public void setMaxValorReferencia(String maxValorReferencia) {
    this.maxValorReferencia = maxValorReferencia;
  }

}
