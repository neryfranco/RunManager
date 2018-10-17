
import modelo.Categoria;
import junit.framework.TestCase;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Jessica
 */
public class TestCategoriaUnitario extends TestCase {

    Categoria categoria;

    public TestCategoriaUnitario() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        categoria = new Categoria();
    }

    @After
    public void tearDown() {
    }

    @Test
    public void testCategoria_InfantilMasculino() {
        Categoria categoria new Categoria();
        Usuario usuario = new Usuario();
        usuario.setSexo(1);
        usuario.setIdade(10);
        assertEquals("Infantil Masculino", categoria.verificaCategoria(usuario));
        
    }

    public void testCategoria_InfantilFeminino() {

    }

    public void testCategoria_AdolescenteMasculino() {

    }

    public void testCategoria_AdolescenteFeminino() {

    }

    public void testCategoria_JovemMasculino() {

    }

    public void testCategoria_JovemFeminino() {

    }

    public void testCategoria_AdultoMasculino() {

    }

    public void testCategoria_AdultoFeminino() {

    }

}
