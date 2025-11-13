package br.com.fiap.one_matter.service;

import br.com.fiap.one_matter.dto.request.CadastroUsuarioDto;
import br.com.fiap.one_matter.dto.request.CadastroUsuarioGerenciadoDto; // NOVO IMPORT
import br.com.fiap.one_matter.model.Usuario;
import br.com.fiap.one_matter.enums.UsuarioRole;
import br.com.fiap.one_matter.repository.UsuarioRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;
    private final PasswordEncoder passwordEncoder;
    // Força a role USER
    @Transactional
    public Usuario criarDefaultUser(CadastroUsuarioDto dto) {
        validarNovoUsuario(dto.email());

        String senhaHash = passwordEncoder.encode(dto.senha());

        Usuario novoUsuario = Usuario.builder()
                .nome(dto.nome())
                .email(dto.email())
                .senhaHash(senhaHash)
                .role(UsuarioRole.USER) // FORÇA A ROLE USER
                .dataCriacao(Instant.now())
                .deleted(0)
                .build();

        return usuarioRepository.save(novoUsuario);
    }

    // Permite definir qualquer role
    @Transactional
    public Usuario criarGerenciado(CadastroUsuarioGerenciadoDto dto) {
        validarNovoUsuario(dto.email());

        String senhaHash = passwordEncoder.encode(dto.senha());

        Usuario novoUsuario = Usuario.builder()
                .nome(dto.nome())
                .email(dto.email())
                .senhaHash(senhaHash)
                .role(dto.role()) // LÊ A ROLE DO DTO GERENCIADO
                .dataCriacao(Instant.now())
                .deleted(0)
                .build();

        return usuarioRepository.save(novoUsuario);
    }

    private void validarNovoUsuario(String email) {
        Optional<Usuario> usuarioExistente = usuarioRepository.findByEmail(email);
        if (usuarioExistente.isPresent()) {
            throw new DataIntegrityViolationException("Já existe um usuário ativo com este e-mail.");
        }
    }
}