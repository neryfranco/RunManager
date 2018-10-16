/*
 * TestesAprovacao.java
 *
 * Created on 25 de Janeiro de 2008, 00:05
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
import modelo.Categoria;
import javax.servlet.http.HttpServletRequest;
import junit.framework.TestCase;
import static org.easymock.EasyMock.*;

/**
 *
 * @author usaer
 */
public class TestCategoria extends TestCase {

    public void testAlunoReprovadoInfrequencia() {
        HttpServletRequest requestMock = createMock(HttpServletRequest.class);
        expect(requestMock.getParameter("vNome")).andReturn("Marco");
        expect(requestMock.getParameter("vNota1")).andReturn("0");
        expect(requestMock.getParameter("vNota2")).andReturn("0");
        expect(requestMock.getParameter("vNotaFinal")).andReturn("0");
        expect(requestMock.getParameter("vFrequencia")).andReturn("74");
        replay(requestMock);

        ServletControllerWeb servletControllerWeb = new ServletControllerWeb();
        assertFalse(servletControllerWeb.verificarAprovacao(requestMock));
    }
}