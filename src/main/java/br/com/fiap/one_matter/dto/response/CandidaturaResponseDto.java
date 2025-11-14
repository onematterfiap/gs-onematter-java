package br.com.fiap.one_matter.dto.response;

import br.com.fiap.one_matter.model.Candidatura;
import java.time.Instant;

public record CandidaturaResponseDto(
        Long idCandidatura,
        Instant dataCandidatura,
        Long idCandidato,
        String nomeCandidato,
        Long idVaga,
        String descVaga,
        String nomeEmpresa
) {
    public static CandidaturaResponseDto fromCandidatura(Candidatura c) {
        return new CandidaturaResponseDto(
                c.getId(),
                c.getDataCriacao(),
                c.getCandidato().getId(),
                c.getCandidato().getNome(),
                c.getVaga().getId(),
                c.getVaga().getDescricao(),
                c.getVaga().getEmpresa().getNome()
        );
    }
}