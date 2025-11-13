package br.com.fiap.one_matter.controller;

import br.com.fiap.one_matter.dto.request.AtualizarUsuarioDto;
import br.com.fiap.one_matter.dto.request.UsuarioResponseHateoas;
import br.com.fiap.one_matter.model.Usuario;
import br.com.fiap.one_matter.service.UsuarioGerenciamentoService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/usuarios")
@RequiredArgsConstructor
public class UsuarioController {

    private final UsuarioGerenciamentoService usuarioGerenciamentoService;

    private UsuarioResponseHateoas toHateoas(Usuario usuario) {
        UsuarioResponseHateoas dto = new UsuarioResponseHateoas(
                usuario.getId(),
                usuario.getNome(),
                usuario.getEmail(),
                usuario.getRole(),
                usuario.getDataCriacao()
        );

        UsuarioController controller = methodOn(UsuarioController.class);

        Link selfLink = linkTo(controller.buscarUsuarioLogado(null)).withSelfRel().withType("GET");
        dto.add(selfLink);

        Link updateLink = linkTo(controller.atualizarUsuario(null, null))
                .withRel("update_details")
                .withType("PUT")
                .withTitle("Atualizar nome e/ou role do usuário logado");
        dto.add(updateLink);

        Link deleteLink = linkTo(controller.deletarUsuario(null))
                .withRel("delete_account")
                .withType("DELETE")
                .withTitle("Excluir conta do usuário logado (irreversível)");
        dto.add(deleteLink);

        dto.add(linkTo(AuthController.class).slash("login").withRel("login_root").withType("POST"));

        return dto;
    }


    @GetMapping("/me")
    public ResponseEntity<UsuarioResponseHateoas> buscarUsuarioLogado(@AuthenticationPrincipal Usuario usuario) {
        // O objeto 'usuario' é injetado pelo Spring Security.
        return ResponseEntity.ok(toHateoas(usuario));
    }

    @PutMapping("/me")
    public ResponseEntity<UsuarioResponseHateoas> atualizarUsuario(
            @AuthenticationPrincipal Usuario usuario,
            @RequestBody @Valid AtualizarUsuarioDto dto) {

        Usuario usuarioAtualizado = usuarioGerenciamentoService.atualizar(usuario.getEmail(), dto);
        return ResponseEntity.ok(toHateoas(usuarioAtualizado));
    }

    @DeleteMapping("/me")
    public ResponseEntity<Void> deletarUsuario(@AuthenticationPrincipal Usuario usuario) {
        usuarioGerenciamentoService.deletar(usuario.getEmail());
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}