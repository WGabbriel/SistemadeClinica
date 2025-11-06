package com.mycompany.sistemadeclinica.controllers;

import com.mycompany.sistemadeclinica.models.Paciente;
import com.mycompany.sistemadeclinica.repository.PacienteRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "PacienteController", urlPatterns = { "/Paciente" })
public class PacienteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        
        if(op != null && op.equals("deletar")){
            
            String cpf = request.getParameter("cpf");
            
            Paciente p = PacienteRepository.getOne(cpf);
            if(p != null){
                PacienteRepository.remove(p);
            }
            
            request.getSession().setAttribute("msg", "Paciente deletado com sucesso!");
            
            response.sendRedirect("Paciente");
            
            return;
        }
        
        if(op != null && op.equals("alterar")){
            
            Paciente p = PacienteRepository.getOne(request.getParameter("cpf"));
            
            request.setAttribute("paciente", p);
            
            getServletContext().getRequestDispatcher("/cadastropaciente.jsp")
                   .forward(request, response);
            
            return;
        
        }
        
        
        List<Paciente> pacientes = PacienteRepository.getAll();
        
        HttpSession session = request.getSession();
        
        session.setAttribute("pacientes", pacientes);
        
        response.sendRedirect("pacientes.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String endereco = request.getParameter("endereco");
        String contato = request.getParameter("contato");
        String planoSaude = request.getParameter("planoSaude");
        
        Paciente p = new Paciente();
        p.setCpf(cpf);
        p.setNome(nome);
        p.setEndereco(endereco);
        p.setContato(contato);
        p.setPlanoSaude(planoSaude);
        
        if(op != null && op.equals("alterar")){
            PacienteRepository.update(p);
            request.getSession().setAttribute("msg","Paciente Alterado com Sucesso!");
        }else{
            PacienteRepository.add(p);
            request.getSession().setAttribute("msg","Paciente Cadastrado com Sucesso!");
        }
        
        response.sendRedirect("Paciente");
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gerenciar pacientes";
    }

}
