/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Nery
 */
public class Ingresso {
    private Lote lote;
    private long numInscricao;
    private Kit kit;
    private Atleta atleta;
    private Pagamento pagamento;
    
    private int lote_id;
    private int kit_numPeito;
    private String atleta_cpf;
    private int pagamento_id;

    public Ingresso(Lote lote, long numInscricao, Kit kit, Atleta atleta, Pagamento pagamento) {
        this.lote = lote;
        this.numInscricao = numInscricao;
        this.kit = kit;
        this.atleta = atleta;
        this.pagamento = pagamento;
    }

    public Lote getLote() {
        return lote;
    }

    public void setLote(Lote lote) {
        this.lote = lote;
    }

    public long getNumInscricao() {
        return numInscricao;
    }

    public void setNumInscricao(long numInscricao) {
        this.numInscricao = numInscricao;
    }

    public Kit getKit() {
        return kit;
    }

    public void setKit(Kit kit) {
        this.kit = kit;
    }

    public Atleta getAtleta() {
        return atleta;
    }

    public void setAtleta(Atleta atleta) {
        this.atleta = atleta;
    }

    public Pagamento getPagamento() {
        return pagamento;
    }

    public void setPagamento(Pagamento pagamento) {
        this.pagamento = pagamento;
    }
    
    
}
