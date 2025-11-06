package com.mycompany.sistemadeclinica.controllers;

import com.mycompany.sistemadeclinica.models.Medicamento;
import com.mycompany.sistemadeclinica.repository.MedicamentoRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "MedicamentoController", urlPatterns = { "/Medicamento" })
public class MedicamentoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        
        if(op != null && op.equals("deletar")){
            
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            
            Medicamento m = MedicamentoRepository.getOne(codigo);
            if(m != null){
                MedicamentoRepository.remove(m);
            }
            
            request.getSession().setAttribute("msg", "Medicamento deletado com sucesso!");
            
            response.sendRedirect("Medicamento");
            
            return;
        }
        
        if(op != null && op.equals("alterar")){
            
            Medicamento m = MedicamentoRepository.getOne(Integer.parseInt(request.getParameter("codigo")));
            
            request.setAttribute("medicamento", m);
            
            getServletContext().getRequestDispatcher("/cadastromedicamento.jsp")
                   .forward(request, response);
            
            return;
        
        }
        
        
        List<Medicamento> medicamentos = MedicamentoRepository.getAll();
        
        HttpSession session = request.getSession();
        
        session.setAttribute("medicamentos", medicamentos);
        
        response.sendRedirect("medicamentos.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String nome = request.getParameter("nome");
        int dosagem = Integer.parseInt(request.getParameter("dosagem"));
        String tipoDosagem = request.getParameter("tipoDosagem");
        String descricao = request.getParameter("descricao");
        String observacao = request.getParameter("observacao");
        
        Medicamento m = new Medicamento();
        m.setCodigo(codigo);
        m.setNome(nome);
        m.setDosagem(dosagem);
        m.setTipoDosagem(tipoDosagem);
        m.setDescricao(descricao);
        m.setObservacao(observacao);
        
        if(op != null && op.equals("alterar")){
            MedicamentoRepository.update(m);
            request.getSession().setAttribute("msg","Medicamento Alterado com Sucesso!");
        }else{
            MedicamentoRepository.add(m);
            request.getSession().setAttribute("msg","Medicamento Cadastrado com Sucesso!");
        }
        
        response.sendRedirect("Medicamento");
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gerenciar medicamentos";
    }

}
