/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import junit.framework.TestCase;
import static junit.framework.TestCase.assertEquals;
import modelo.Categoria;
import modelo.Usuario;

/**
 *
 * @author elena.bastos
 */
public class TestCategoriaJUnit extends TestCase {
    
 
    public void testUsuarioInfantilMasculino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(11);
        usuario.setSexo("1");
        assertEquals("Infantil Masculino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioInfantilFeminino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(11);
        usuario.setSexo("2");
        assertEquals("Infantil Feminino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioAdolescenteMasculino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(17);
        usuario.setSexo("1");
        assertEquals("Adolescente Masculino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioAdolescenteFeminino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(17);
        usuario.setSexo("2");
        assertEquals("Adolescente Feminino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioJovemMasculino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(29);
        usuario.setSexo("1");
        assertEquals("Jovem Masculino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioJovemFeminino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(29);
        usuario.setSexo("2");
        assertEquals("Jovem Feminino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioAdultoMasculino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(49);
        usuario.setSexo("1");
        assertEquals("Adulto Masculino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioAdultoFeminino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(49);
        usuario.setSexo("2");
        assertEquals("Adulto Feminino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioIdosoMasculino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(50);
        usuario.setSexo("1");
        assertEquals("Idoso Masculino", Categoria.verificaCategoria(usuario));
    }
    
    public void testUsuarioIdosoFeminino() {
        Usuario usuario = new Usuario();
        usuario.setIdade(50);
        usuario.setSexo("2");
        assertEquals("Idoso Feminino", Categoria.verificaCategoria(usuario));
    }
}
