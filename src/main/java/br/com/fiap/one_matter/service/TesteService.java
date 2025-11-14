package br.com.fiap.one_matter.service;

import br.com.fiap.one_matter.dto.request.TesteRequestDto;
import br.com.fiap.one_matter.model.Questao;
import br.com.fiap.one_matter.model.Teste;
import br.com.fiap.one_matter.model.TesteQuestao;
import br.com.fiap.one_matter.model.TesteQuestaoId;
import br.com.fiap.one_matter.model.Vaga;
import br.com.fiap.one_matter.repository.TesteQuestaoRepository;
import br.com.fiap.one_matter.repository.TesteRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class TesteService {

    private final TesteRepository testeRepository;
    private final TesteQuestaoRepository testeQuestaoRepository;
    private final VagaService vagaService;
    private final QuestaoService questaoService;

    public Teste buscarPorId(Long id) {
        return testeRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Teste não encontrado."));
    }

    @Transactional
    public Teste criar(TesteRequestDto dto) {
        Vaga vaga = vagaService.buscarPorId(dto.idVaga()); // Valida se a vaga existe

        Teste teste = Teste.builder()
                .dataInicio(dto.dataInicio())
                .dataFim(dto.dataFim())
                .vaga(vaga)
                .build();

        return testeRepository.save(teste);
    }

    @Transactional
    public TesteQuestao associarQuestao(Long idTeste, Long idQuestao) {
        Teste teste = buscarPorId(idTeste);
        Questao questao = questaoService.buscarPorId(idQuestao);

        TesteQuestaoId associacaoId = new TesteQuestaoId();
        associacaoId.setTesteId(teste.getId());
        associacaoId.setQuestaoId(questao.getId());

        TesteQuestao associacao = new TesteQuestao(associacaoId, teste, questao);
        return testeQuestaoRepository.save(associacao);
    }

    // (A lógica de listar questões do teste já está na entidade Teste,
    // mas precisaria de DTOs para evitar LazyInitializationException)
}