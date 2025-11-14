package br.com.fiap.one_matter.dto.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record RecrutadorRequestDto(
        @NotBlank @Size(max = 90)
        String nome,

        @Size(max = 11)
        String telefone,

        @NotBlank @Size(min = 10, max = 10) // Ajuste conforme seu BD (CPF 10?)
        String cpf,

        @NotBlank @Email @Size(max = 30)
        String email,

        @NotNull
        Long idEmpresa
) {}