<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div id="consultasMarcadas">
            <h4>Consultas Marcadas</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Paciente</th>
                        <th>Data da Consulta</th>
                        <th>Data da Volta</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="consulta" items="${requestScope.consultas}">
                        <c:if test="${consulta.prontuario == null}">
                            <tr class="align-middle">
                                <td>${consulta.paciente.nome}</td>
                                <td>${consulta.dataHora}</td>
                                <td>${consulta.dataHoraVolta}</td>
                                <td>Marcada</td>
                                <td>
                                    <form>
                                        <input type="hidden" name="codigo" value="${consulta.codigo}" />
                                        <button formaction="consultas" formmethod="post" name="op" value="detalhes"
                                            class="btn btn-sm btn-primary">Ver Detalhes</button>
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>