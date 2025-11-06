<%@page import="com.mycompany.sistemadeclinica.models.IndicadorExame"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Indicadores de Exame - Sistema de Clínica</title>
    </head>
    <body>
        <div class="container mt-5">
            <%
                List<IndicadorExame> indicadores = (List) session.getAttribute("indicadores");
                String msg = (String) session.getAttribute("msg");

                if (msg != null) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= msg%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                    session.removeAttribute("msg");
                }
            %>

            <h1>Indicadores de Exame Cadastrados</h1>
            <a href="index.html" class="btn btn-secondary mb-3">Voltar</a>
            <a href="#" class="btn btn-success mb-3"
               data-bs-toggle="modal" data-bs-target="#modalCadastro">Cadastrar Novo Indicador</a>
            
            <%
                if (indicadores == null || indicadores.isEmpty()) {
            %>
            <div class="alert alert-warning">Não existem indicadores de exame cadastrados</div>
            <%
            } else {
            %>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Indicador</th>
                        <th>Descrição</th>
                        <th>Valor Mín.</th>
                        <th>Valor Máx.</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (IndicadorExame i : indicadores) {
                    %>
                    <tr>
                        <td><%= i.getCodigo()%></td>
                        <td><%= i.getIndicador()%></td>
                        <td><%= i.getDescricao()%></td>
                        <td><%= i.getMinValorReferencia()%></td>
                        <td><%= i.getMaxValorReferencia()%></td>
                        <td>
                            <a href="IndicadorExame?codigo=<%= i.getCodigo()%>&op=alterar"
                               class="btn btn-info btn-sm">Alterar</a>
                            <a href="IndicadorExame?codigo=<%= i.getCodigo()%>&op=deletar"
                               class="btn btn-warning btn-sm"
                               onclick="return confirm('Deseja realmente deletar este indicador?')">Deletar</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                }
            %>

            <div class="modal fade" id="modalCadastro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cadastro de Indicador de Exame</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="cadastroindicadorexame.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
