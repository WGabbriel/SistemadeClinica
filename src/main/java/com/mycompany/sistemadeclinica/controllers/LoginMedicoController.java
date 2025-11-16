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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("medicoLogado") != null) {
            response.sendRedirect("consultas");
            return;
        }

        request.getRequestDispatcher("loginMedico.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op") != null ? request.getParameter("op") : "";

        switch (op) {
            case "login": {
                String crm = request.getParameter("crm");
                String password = request.getParameter("password");

                Medico m = MedicoRepository.login(crm, password);

                if (m != null) {
                    request.getSession().setAttribute("medicoLogado", m);
                    response.sendRedirect("consultas");
                } else {
                    request.getSession().setAttribute("msg", "Erro no Login");
                    response.sendRedirect("loginMedico");
                }
                break;
            }
            case "cadastro": {
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
                response.sendRedirect("loginMedico");
                break;
            }
            case "logout": {
                request.getSession().removeAttribute("medicoLogado");
                response.sendRedirect("loginMedico");
                break;
            }
        }

    }
}
