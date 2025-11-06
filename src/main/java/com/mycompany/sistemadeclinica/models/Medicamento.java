package com.mycompany.sistemadeclinica.models;

public class Medicamento {

  private int codigo;
  private String nome;
  private int dosagem;
  private String tipoDosagem;
  private String descricao;
  private String observacao;

  public int getCodigo() {
    return codigo;
  }

  public void setCodigo(int codigo) {
    this.codigo = codigo;
  }

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public int getDosagem() {
    return dosagem;
  }

  public void setDosagem(int dosagem) {
    this.dosagem = dosagem;
  }

  public String getTipoDosagem() {
    return tipoDosagem;
  }

  public void setTipoDosagem(String tipoDosagem) {
    this.tipoDosagem = tipoDosagem;
  }

  public String getDescricao() {
    return descricao;
  }

  public void setDescricao(String descricao) {
    this.descricao = descricao;
  }

  public String getObservacao() {
    return observacao;
  }

  public void setObservacao(String observacao) {
    this.observacao = observacao;
  }

}