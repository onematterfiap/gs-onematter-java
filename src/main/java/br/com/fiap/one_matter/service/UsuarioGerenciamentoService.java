package br.com.fiap.one_matter.service;

import br.com.fiap.one_matter.dto.request.AtualizarUsuarioDto;
import br.com.fiap.one_matter.model.Usuario;
import br.com.fiap.one_matter.repository.UsuarioRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UsuarioGerenciamentoService {

    private final UsuarioRepository usuarioRepository;

    public Usuario buscarPorEmail(String email) {
        return usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Usuário logado não encontrado."));
    }

    @Transactional
    public Usuario atualizar(String email, AtualizarUsuarioDto dto) {
        Usuario usuario = buscarPorEmail(email);

        if (dto.nome() != null && !dto.nome().isBlank()) {
            usuario.setNome(dto.nome());
        }

        if (dto.role() != null) {
            usuario.setRole(dto.role());
        }

        return usuario;
    }

    @Transactional
    public void deletar(String email) {
        Usuario usuario = buscarPorEmail(email);

        usuario.setDeleted(1);
        usuarioRepository.save(usuario);
    }

    public Page<Usuario> listar(Optional<Integer> deletedStatus, Pageable pageable) {
        if (deletedStatus.isPresent() && (deletedStatus.get() == 0 || deletedStatus.get() == 1)) {
            // Se o filtro for 0 (ativo) ou 1 (deletado), usa metodo filtrado
            return usuarioRepository.findByDeleted(deletedStatus.get(), pageable);
        }
        // Se o filtro estiver ausente ou inválido, lista TODOS (ativos e deletados)
        return usuarioRepository.findAll(pageable);
    }
}