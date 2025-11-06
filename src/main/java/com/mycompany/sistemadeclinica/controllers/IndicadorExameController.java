package com.mycompany.sistemadeclinica.controllers;

import com.mycompany.sistemadeclinica.models.IndicadorExame;
import com.mycompany.sistemadeclinica.repository.IndicadorExameRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "IndicadorExameController", urlPatterns = { "/IndicadorExame" })
public class IndicadorExameController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        
        if(op != null && op.equals("deletar")){
            
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            
            IndicadorExame i = IndicadorExameRepository.getOne(codigo);
            if(i != null){
                IndicadorExameRepository.remove(i);
            }
            
            request.getSession().setAttribute("msg", "Indicador de Exame deletado com sucesso!");
            
            response.sendRedirect("IndicadorExame");
            
            return;
        }
        
        if(op != null && op.equals("alterar")){
            
            IndicadorExame i = IndicadorExameRepository.getOne(Integer.parseInt(request.getParameter("codigo")));
            
            request.setAttribute("indicadorExame", i);
            
            getServletContext().getRequestDispatcher("/cadastroindicadorexame.jsp")
                   .forward(request, response);
            
            return;
        
        }
        
        
        List<IndicadorExame> indicadores = IndicadorExameRepository.getAll();
        
        HttpSession session = request.getSession();
        
        session.setAttribute("indicadores", indicadores);
        
        response.sendRedirect("indicadoresexame.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String indicador = request.getParameter("indicador");
        String descricao = request.getParameter("descricao");
        String minValorReferencia = request.getParameter("minValorReferencia");
        String maxValorReferencia = request.getParameter("maxValorReferencia");
        
        IndicadorExame i = new IndicadorExame();
        i.setCodigo(codigo);
        i.setIndicador(indicador);
        i.setDescricao(descricao);
        i.setMinValorReferencia(minValorReferencia);
        i.setMaxValorReferencia(maxValorReferencia);
        
        if(op != null && op.equals("alterar")){
            IndicadorExameRepository.update(i);
            request.getSession().setAttribute("msg","Indicador de Exame Alterado com Sucesso!");
        }else{
            IndicadorExameRepository.add(i);
            request.getSession().setAttribute("msg","Indicador de Exame Cadastrado com Sucesso!");
        }
        
        response.sendRedirect("IndicadorExame");
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gerenciar indicadores de exame";
    }

}
