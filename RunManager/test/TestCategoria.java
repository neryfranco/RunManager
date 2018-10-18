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
import modelo.Usuario;
import static org.easymock.EasyMock.*;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;

/**
 *
 * @author usaer
 */
public class TestCategoria extends TestCase {
    
    Usuario usuario;
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        usuario = new Usuario();
    }
    
    @After
    public void tearDown() {
    }

    public void testUsuarioInfantilMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(11);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        assertEquals("Infantil Masculino", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioInfantilFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(11);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        assertEquals("Infantil Feminino", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioAdolescenteMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(17);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        assertEquals("Adolescente Masculino", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioAdolescenteFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(17);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        assertEquals("Adolescente Feminino", Categoria.verificaCategoria(usuarioMock));
    }

    public void testUsuarioJovemMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(29);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        assertEquals("Jovem Masculino", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioJovemFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(29);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        assertEquals("Jovem Feminino", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioAdultoMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(49);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        assertEquals("Adulto Masculino", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioAdultoFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(49);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        assertEquals("Adulto Feminino", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioIdosoMasculino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(50);
        expect(usuarioMock.getSexo()).andReturn("1");
        replay(usuarioMock);
        
        assertEquals("Idoso Masculino", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioIdosoFeminino() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(50);
        expect(usuarioMock.getSexo()).andReturn("2");
        replay(usuarioMock);
        
        assertEquals("Idoso Feminino", Categoria.verificaCategoria(usuarioMock));
    }
    
        public void testUsuarioInfantil() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(11);
        expect(usuarioMock.getSexo()).andReturn("3");
        replay(usuarioMock);
        
        assertEquals("Infantil", Categoria.verificaCategoria(usuarioMock));
    }
                
    public void testUsuarioAdolescente() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(17);
        expect(usuarioMock.getSexo()).andReturn("3");
        replay(usuarioMock);
        
        assertEquals("Adolescente", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioJovem() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(29);
        expect(usuarioMock.getSexo()).andReturn("3");
        replay(usuarioMock);
        
        assertEquals("Jovem", Categoria.verificaCategoria(usuarioMock));
    }
        
    public void testUsuarioAdulto() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(49);
        expect(usuarioMock.getSexo()).andReturn("3");
        replay(usuarioMock);
        
        assertEquals("Adulto", Categoria.verificaCategoria(usuarioMock));
    }
    
    public void testUsuarioIdoso() {
        IUsuario usuarioMock = createMock(IUsuario.class);
        expect(usuarioMock.getIdade()).andReturn(50);
        expect(usuarioMock.getSexo()).andReturn("3");
        replay(usuarioMock);
        
        assertEquals("Idoso", Categoria.verificaCategoria(usuarioMock));
    }
}