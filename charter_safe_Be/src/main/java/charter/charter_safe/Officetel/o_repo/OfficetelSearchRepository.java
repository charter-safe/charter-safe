package charter.charter_safe.Officetel.o_repo;

import charter.charter_safe.Officetel.o_domain.OfficetelDocument;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OfficetelSearchRepository extends ElasticsearchRepository<OfficetelDocument, Long> {
    List<OfficetelDocument> findByUmdNm(String umdNm);
    List<OfficetelDocument> findBySggNm(String sggNm);


}
