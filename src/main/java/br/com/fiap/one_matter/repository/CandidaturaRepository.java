package br.com.fiap.one_matter.repository;

import br.com.fiap.one_matter.model.Candidatura;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface CandidaturaRepository extends JpaRepository<Candidatura, Long> {
    Page<Candidatura> findByDeleted(Integer deleted, Pageable pageable);
    Optional<Candidatura> findByIdAndDeleted(Long id, Integer deleted);
    Optional<Candidatura> findByCandidatoIdAndVagaIdAndDeleted(Long candidatoId, Long vagaId, Integer deleted);
    Page<Candidatura> findByCandidatoIdAndDeleted(Long candidatoId, Integer deleted, Pageable pageable);
    Page<Candidatura> findByVagaIdAndDeleted(Long vagaId, Integer deleted, Pageable pageable);
}