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
    
     IM imc;

    public IMCTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    @Override
    public void setUp() {
        imc = new IMC();
    }

    @After
    @Override
    public void tearDown() {
    }

    @Test
    public void testCalculaIMC_HomemAbaixoPeso() {
        imc.setAltura(1.2);
        imc.setPeso(21.0);
        imc.setSexo(true);
        imc.getIMC();
    }

    public void testCalculaIMC_HomemPesoNormal() {
        imc.setAltura(1.2);
        imc.setPeso(26.3);
        imc.setSexo(true);
        imc.getIMC();
    }

    public void testCalculaIMC_HomemMarginalmenteAcimaPeso() {
        imc.setAltura(1.2);
        imc.setPeso(27.7);
        imc.setSexo(true);
        imc.getIMC();
    }

    public void testCalculaIMC_HomemAcimaPeso() {
        imc.setAltura(1.2);
        imc.setPeso(31.0);
        imc.setSexo(true);
        imc.getIMC();
    }

    public void testCalculaIMC_HomemObeso() {
        imc.setAltura(1.2);
        imc.setPeso(31.1);
        imc.setSexo(true);
        imc.getIMC();
    }

    public void testCalculaIMC_MulherAbaixoPeso() {
        imc.setAltura(1.2);
        imc.setPeso(19.0);
        imc.setSexo(false);
        imc.getIMC();
    }

    public void testCalculaIMC_MulherPesoNormal() {
        imc.setAltura(1.2);
        imc.setPeso(25.7);
        imc.setSexo(false);
        imc.getIMC();
    }

    public void testCalculaIMC_MulherMarginalmenteAcimaPeso() {
        imc.setAltura(1.2);
        imc.setPeso(27.2);
        imc.setSexo(false);
        imc.getIMC();
    }

    public void testCalculaIMC_MulherAcimaPeso() {
        imc.setAltura(1.2);
        imc.setPeso(32.2);
        imc.setSexo(false);
        imc.getIMC();
    }

    public void testCalculaIMC_MulherObeso() {
        imc.setAltura(1.2);
        imc.setPeso(32.3);
        imc.setSexo(false);
        imc.getIMC();
    }
    
    
}
