package com.mycompany.sistemadeclinica.controllers;

import java.io.IOException;

import com.mycompany.sistemadeclinica.models.Medico;
import com.mycompany.sistemadeclinica.repository.MedicoRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginMedicoController", urlPatterns = { "/loginMedico" })
public class LoginMedicoController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String op = request.getParameter("op");

    switch (op) {
      case "logout":
        request.getSession().removeAttribute("medicoLogado");
        response.sendRedirect("loginMedico.jsp");
        break;

      case "perfil":
        getServletContext().getRequestDispatcher("/WEB-INF/jsps/medico/perfilMedico.jsp")
            .forward(request, response);
        break;

      default:
        getServletContext()
            .getRequestDispatcher("/WEB-INF/jsps/indexMedico.jsp")
            .forward(request, response);
        break;

    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String op = request.getParameter("op");

    if (op != null && op.equals("alterarSenha")) {

      Medico m = (Medico) request.getSession()
          .getAttribute("medicoLogado");

      if (!m.getPassword().equals(request.getParameter("atual"))) {
        request.setAttribute("msg", "você errou a senha atual!");
        getServletContext()
            .getRequestDispatcher("/WEB-INF/jsps/medico/indexMedico.jsp")
            .forward(request, response);
      }
      if (!request.getParameter("nova").equals(request.getParameter("confirm"))) {
        request.setAttribute("msg", "A nova senha e a confirmação não batem!");
        getServletContext()
            .getRequestDispatcher("/WEB-INF/jsps/medico/indexMedico.jsp")
            .forward(request, response);
      }

      MedicoRepository.alterarSenha(m.getCrm(), request.getParameter("nova"));

      request.setAttribute("msg", "A senha foi alterada com sucesso!");
      request.setAttribute("svd", "ok");
      getServletContext()
          .getRequestDispatcher("/WEB-INF/jsps/medico/indexMedico.jsp")
          .forward(request, response);

      return;

    }

    if (op != null && op.equals("login")) {
      String crm = request.getParameter("crm");
      String password = request.getParameter("password");

      Medico m = MedicoRepository.login(crm, password);

      if (m != null) {
        request.getSession().setAttribute("medicoLogado", m);
        response.sendRedirect("consultas"); 
      } else {
        request.setAttribute("msg", "CRM ou senha inválidos!");
        getServletContext()
            .getRequestDispatcher("/WEB-INF/jsps/medico/indexMedico.jsp")
            .forward(request, response);

      }
    }
    if (op != null && op.equals("cadastro")) {
      String crm = request.getParameter("crm");
      String nome = request.getParameter("nome");
      String especialidade = request.getParameter("especialidade");
      String password = request.getParameter("password");

      Medico m = new Medico();
      m.setCrm(crm);
      m.setNome(nome);
      m.setEspecialidade(especialidade);
      m.setPassword(password);
      MedicoRepository.add(m);

      request.getSession().setAttribute("msg", "Médico cadastrado com sucesso!");
      request.getSession().setAttribute("svd", "ok");
      response.sendRedirect("loginMedico.jsp");
    }
  }
}
