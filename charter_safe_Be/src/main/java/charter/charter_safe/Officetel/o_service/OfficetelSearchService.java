package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_domain.Officetel;
import charter.charter_safe.Officetel.o_domain.OfficetelDocument;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OfficetelSearchService {

    private final ElasticsearchOperations elasticsearchOperations;

    public void save(Officetel officetel) {
        elasticsearchOperations.save(OfficetelDocument.from(officetel));
    }
}
