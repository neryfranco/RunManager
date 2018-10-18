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
import modelo.IUsuario;
import static org.easymock.EasyMock.*;

/**
 *
 * @author usaer
 */
public class TestCategoria extends TestCase {

    public void testUsuarioInfantilMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(11);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Infantil Masculino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioInfantilFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(11);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Infantil Feminino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioAdolescenteMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(17);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Adolescente Masculino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioAdolescenteFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(17);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Adolescente Feminino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioJovemMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(29);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Jovem Masculino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioJovemFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(29);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Jovem Feminino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioAdultoMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(49);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Adulto Masculino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioAdultoFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(49);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Adulto Feminino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioIdosoMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(50);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Idoso Masculino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioIdosoFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(50);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals("Idoso Feminino", categoria.verificaCategoria(usuarioMock));
    }
    
    public void testDadosIncorretos() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(50);
        expect(usuarioMock.getSexo()).andReturn("3");
        replay(usuarioMock);
        
        Categoria categoria = new Categoria(0,"0","0","0","0");
        assertEquals(null, categoria.verificaCategoria(usuarioMock));
    }
}