package br.com.fiap.one_matter.controller;

import br.com.fiap.one_matter.dto.request.AssociacaoRequestDto;
import br.com.fiap.one_matter.dto.request.TesteRequestDto;
import br.com.fiap.one_matter.dto.response.TesteResponseDto;
import br.com.fiap.one_matter.model.Teste;
import br.com.fiap.one_matter.service.TesteService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/testes")
@RequiredArgsConstructor
@PreAuthorize("hasRole('ADMIN')")
public class TesteController {

    private final TesteService testeService;

    @GetMapping("/{id}")
    public ResponseEntity<TesteResponseDto> buscarTestePorId(@PathVariable Long id) {
        Teste t = testeService.buscarPorId(id);
        return ResponseEntity.ok(TesteResponseDto.fromTeste(t));
    }

    @PostMapping
    public ResponseEntity<TesteResponseDto> criarTeste(@RequestBody @Valid TesteRequestDto dto) {
        Teste t = testeService.criar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(TesteResponseDto.fromTeste(t));
    }

    @PostMapping("/associar-questao")
    public ResponseEntity<String> associarQuestao(
            @RequestBody @Valid AssociacaoRequestDto dto) {
        // dto.idPrincipal = idTeste
        // dto.idAssociado = idQuestao
        testeService.associarQuestao(dto.idPrincipal(), dto.idAssociado());
        return ResponseEntity.ok("Questão " + dto.idAssociado() + " associada ao Teste " + dto.idPrincipal());
    }

    // (Outros endpoints de CRUD para Teste: PUT, DELETE, GET (listar) podem ser adicionados)
}