package br.com.fiap.one_matter.dto.request;

import br.com.fiap.one_matter.enums.UsuarioRole;
import jakarta.validation.constraints.Size;

public record AtualizarUsuarioDto(
        @Size(max = 100, message = "O nome deve ter no máximo 100 caracteres.")
        String nome,

        UsuarioRole role
) {}