package com.mycompany.sistemadeclinica.controllers;

import com.mycompany.sistemadeclinica.models.Medico;
import com.mycompany.sistemadeclinica.repository.MedicoRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "MedicoController", urlPatterns = { "/Medico" })
public class MedicoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        
        if(op != null && op.equals("deletar")){
            
            String crm = request.getParameter("crm");
            
            Medico m = MedicoRepository.getOne(crm);
            if(m != null){
                MedicoRepository.remove(m);
            }
            
            request.getSession().setAttribute("msg", "Médico deletado com sucesso!");
            
            response.sendRedirect("Medico");
            
            return;
        }
        
        if(op != null && op.equals("alterar")){
            
            Medico m = MedicoRepository.getOne(request.getParameter("crm"));
            
            request.setAttribute("medico", m);
            
            getServletContext().getRequestDispatcher("/cadastromedico.jsp")
                   .forward(request, response);
            
            return;
        
        }
        
        
        List<Medico> medicos = MedicoRepository.getAll();
        
        HttpSession session = request.getSession();
        
        session.setAttribute("medicos", medicos);
        
        response.sendRedirect("medicos.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        
        String crm = request.getParameter("crm");
        String nome = request.getParameter("nome");
        String especialidade = request.getParameter("especialidade");
        String contato = request.getParameter("contato");
        
        Medico m = new Medico();
        m.setCrm(crm);
        m.setNome(nome);
        m.setEspecialidade(especialidade);
        m.setContato(contato);
        
        if(op != null && op.equals("alterar")){
            MedicoRepository.update(m);
            request.getSession().setAttribute("msg","Médico Alterado com Sucesso!");
        }else{
            MedicoRepository.add(m);
            request.getSession().setAttribute("msg","Médico Cadastrado com Sucesso!");
        }
        
        response.sendRedirect("Medico");
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gerenciar médicos";
    }

}
