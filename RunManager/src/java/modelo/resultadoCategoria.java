/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Jessica
 */
public class resultadoCategoria {

    public String verificaCategoria(InterfaceCategoria usuario) {
        int idade = usuario.getIdade();
        String sexo = usuario.getSexo();
        if (idade < 12) {
            if (sexo.equals("1")) {
                return "Infantil Masculino";
            } else if (sexo.equals("2")) {
                return "Infantil Feminino";
            }
        } else if (idade < 18) {
            if (sexo.equals("1")) {
                return "Adolescente Masculino";
            } else if (sexo.equals("2")) {
                return "Adolescente Feminino";
            }
        } else if (idade < 30) {
            if (sexo.equals("1")) {
                return "Jovem Masculino";
            } else if (sexo.equals("2")) {
                return "Jovem Feminino";
            }
        } else if (idade < 50) {
            if (sexo.equals("1")) {
                return "Adulto Masculino";
            } else if (sexo.equals("2")) {
                return "Adulto Feminino";
            }
        } else {
            if (sexo.equals("1")) {
                return "Idoso Masculino";
            } else if (sexo.equals("2")) {
                return "Idoso Feminino";
            }
        }
        return null;
    }

}
