/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.api;

import com.google.gson.Gson;
import java.util.HashMap;
import java.util.List;
import modelo.Administrador;
import modelo.Atleta;
import modelo.Categoria;
import modelo.Chip;
import modelo.Corrida;
import modelo.Kit;
import modelo.Lote;
import modelo.Organizador;
import modelo.Pagamento;
import modelo.Percurso;
import modelo.Ranking;
import modelo.Tapete;

/**
 *
 * @author vicdo
 */
public class GenericsApi {
    public static String serialize(String object) throws ClassNotFoundException{
        HashMap stringClasse = new HashMap<>();
        stringClasse.put("Administrador", Administrador.obterAdministradores());
        stringClasse.put("Atleta", Atleta.obterAtletas());
        stringClasse.put("Categoria", Categoria.obterCategorias());
        stringClasse.put("Chip", Chip.obterChips());
        stringClasse.put("Corrida", Corrida.obterCorridas());
        stringClasse.put("Kit", Kit.obterKits());
        stringClasse.put("Lote", Lote.obterLotes());
        stringClasse.put("Organizador", Organizador.obterOrganizadores());
        stringClasse.put("Pagamento", Pagamento.obterPagamentos());
        stringClasse.put("Percurso", Percurso.obterPercursos());
        stringClasse.put("Ranking", Ranking.obterRankings());
        stringClasse.put("Tapete", Tapete.obterTapetes());

        List<Object> jsonReturn = (List<Object>) stringClasse.get(object);
        return new Gson().toJson(jsonReturn);
    }
}
