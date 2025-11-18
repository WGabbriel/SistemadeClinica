package com.mycompany.sistemadeclinica.controllers;

import java.io.IOException;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Consulta;
import com.mycompany.sistemadeclinica.models.Medico;
import com.mycompany.sistemadeclinica.models.Paciente;
import com.mycompany.sistemadeclinica.models.Prontuario;
import com.mycompany.sistemadeclinica.repository.ConsultaRepository;
import com.mycompany.sistemadeclinica.repository.PacienteRepository;
import com.mycompany.sistemadeclinica.repository.ProntuarioRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ConsultaController", urlPatterns = { "/consultas" })
public class ConsultaController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    if (request.getSession().getAttribute("medicoLogado") == null) {
      response.sendRedirect("loginMedico");
      return;
    }

    String op = request.getParameter("op") != null ? request.getParameter("op") : "";

    switch (op) {
      case "detalhes":
        String codigo = request.getParameter("codigo");
        Consulta consulta = ConsultaRepository.getOne(Integer.parseInt(codigo));
        request.setAttribute("consulta", consulta);
        request.getRequestDispatcher("/WEB-INF/jsps/consulta/consultaDetalhes.jsp").forward(request, response);
        break;

      default:
        Medico m = (Medico) request.getSession().getAttribute("medicoLogado");
        List<Consulta> consultas = ConsultaRepository.findByMedicoCrm(m.getCrm());
        List<Paciente> pacientes = PacienteRepository.getAll();
        request.setAttribute("consultas", consultas);
        request.setAttribute("pacientes", pacientes);
        getServletContext().getRequestDispatcher("/WEB-INF/jsps/medico/indexMedico.jsp").forward(request, response);
        break;
    }

  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String op = request.getParameter("op") != null ? request.getParameter("op") : "";

    switch (op) {
      case "detalhes":
        String codigo = request.getParameter("codigo");
        Consulta consulta = ConsultaRepository.getOne(Integer.parseInt(codigo));
        request.setAttribute("consulta", consulta);
        request.getRequestDispatcher("/WEB-INF/jsps/consulta/consultaDetalhes.jsp").forward(request, response);
        break;

      default:
        Paciente p = PacienteRepository.getOne(request.getParameter("pacienteId"));
        Medico m = (Medico) request.getSession().getAttribute("medicoLogado");
        String data = (String) request.getParameter("dataConsulta");
        String dataVolta = (String) request.getParameter("dataHoraVolta");
        String obs = (String) request.getParameter("observacoes");

        Consulta c = new Consulta();

        c.setPaciente(p);
        c.setMedico(m);
        c.setDataHora(data);
        c.setDataHoraVolta(dataVolta);
        c.setObservacao(obs);

        ConsultaRepository.add(c);

        response.sendRedirect("consultas");

        break;
    }

  }
}
