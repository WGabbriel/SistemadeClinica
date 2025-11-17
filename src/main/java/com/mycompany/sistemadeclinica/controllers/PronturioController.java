package com.mycompany.sistemadeclinica.controllers;

import java.io.IOException;

import com.mycompany.sistemadeclinica.models.Consulta;
import com.mycompany.sistemadeclinica.models.Prontuario;
import com.mycompany.sistemadeclinica.repository.ConsultaRepository;
import com.mycompany.sistemadeclinica.repository.ProntuarioRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PronturioController", urlPatterns = "/prontuario")
public class PronturioController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String op = request.getParameter("op") != null ? request.getParameter("op") : "";

    switch (op) {
      case "add":
        String codigo = request.getParameter("consulta");
        Consulta consulta = ConsultaRepository.getOne(Integer.parseInt(codigo));
        request.setAttribute("consulta", consulta);
        getServletContext().getRequestDispatcher("/WEB-INF/jsps/prontuario/prontuarioAdd.jsp").forward(request,
            response);
        break;
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String op = request.getParameter("op") != null ? request.getParameter("op") : "";

    switch (op) {
      case "add":
        Consulta c = (Consulta) ConsultaRepository.getOne(Integer.parseInt(request.getParameter("consulta")));
        String descricao = request.getParameter("descricao");
        String observacao = request.getParameter("observacao");

        Prontuario p = new Prontuario();
        p.setDescricao(descricao);
        p.setObservacao(observacao);
        p.setConsulta(c);
        ProntuarioRepository.add(p);
        getServletContext().getRequestDispatcher("/WEB-INF/jsps/consulta/consultaDetalhes.jsp").forward(request,
            response);
        break;
    }

  }
}
