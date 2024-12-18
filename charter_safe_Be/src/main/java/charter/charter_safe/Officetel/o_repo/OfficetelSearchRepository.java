package charter.charter_safe.Officetel.o_repo;

import charter.charter_safe.Officetel.o_domain.OfficetelDocument;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OfficetelSearchRepository extends ElasticsearchRepository<OfficetelDocument, Long> {
    Optional<OfficetelDocument> findById(Long id);

    @Query("{\"bool\": { \"must\": [{\"match_phrase_prefix\": {\"sggNm\": \"*?0*\"}}]}}")
    Page<OfficetelDocument> findBySggNm(String sggNm, Pageable pageable);

}
