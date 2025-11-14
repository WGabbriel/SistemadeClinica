package com.mycompany.sistemadeclinica.controllers;

import java.io.IOException;
import java.util.List;

import com.mycompany.sistemadeclinica.models.Consulta;
import com.mycompany.sistemadeclinica.models.Medico;
import com.mycompany.sistemadeclinica.models.Paciente;
import com.mycompany.sistemadeclinica.repository.ConsultaRepository;
import com.mycompany.sistemadeclinica.repository.PacienteRepository;

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
    Medico m = (Medico) request.getSession().getAttribute("medicoLogado");
    List<Consulta> consultas = ConsultaRepository.findByMedicoCrm(m.getCrm());
    List<Paciente> pacientes = PacienteRepository.getAll();
    request.setAttribute("consultas", consultas);
    request.setAttribute("pacientes", pacientes);
    request.getRequestDispatcher("/WEB-INF/jsps/medico/indexMedico.jsp").forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
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
  }
}
