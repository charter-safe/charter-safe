package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_domain.Officetel;
import charter.charter_safe.Officetel.o_domain.OfficetelDocument;
import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDataDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDto;
import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
import charter.charter_safe.Officetel.o_repo.OfficetelSearchRepository;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OfficetelSearchService {

    private final OfficetelSearchRepository officetelSearchRepository;
    private final ElasticsearchOperations elasticsearchOperations;
    //private final DataMapper dataMapper;

    @Transactional
    public void save(Officetel officetel) {
        elasticsearchOperations.save(OfficetelDocument.from(officetel));
    }

    @Transactional
    public List<OfficetelDto> searchOfficetel(String sggNm, Pageable pageable) {
        return officetelSearchRepository.findBySggNm(sggNm,pageable).stream()
                .map(OfficetelDto::of)
                .collect(Collectors.toList());
    }

//    @Transactional
//    public List<OfficetelDocument> saveData(List<OfficetelCharterDto> charterList, List<OfficetelTradeDto> tradeList) {
//        List<OfficetelDataDto> mappedData = dataMapper.mapRentAndTrade(charterList, tradeList);
//
//        // Officetel 엔티티로 변환 후 저장
//        List<OfficetelDocument> officetelEntities = mappedData.stream().map(data -> {
//            long charterPrice = Long.parseLong(data.getOfficetelCharterDto().getDeposit().replace(",", ""));
//            long tradePrice = Long.parseLong(data.getOfficetelTradeDto().getDealAmount().replace(",", ""));
//            double charterRate = (charterPrice / (double) tradePrice) * 100; // 전세가율 계산
//
//            return OfficetelDocument.builder()
//                    .offiNm(data.getOfficetelCharterDto().getOffiNm()) // 오피스텔 이름
////                    .sggNm(data.getOfficetelCharterDto().getSggNm())
////                    .umdNm(data.getOfficetelCharterDto().getUmdNm())
////                    .jibun(data.getOfficetelCharterDto().getJibun())
////                    .deposit(charterPrice)
////                    .floor(data.getOfficetelCharterDto().getFloor())
////                    .buildYear(data.getOfficetelCharterDto().getBuildYear())
////                    .excluUseAr(data.getOfficetelCharterDto().getExcluUseAr())
////                    .contractTerm(data.getOfficetelCharterDto().getContractTerm())
////                    .monthlyRent(data.getOfficetelCharterDto().getMonthlyRent())
//                    .address(data.getOfficetelCharterDto().getSggNm() + " " + data.getOfficetelCharterDto().getUmdNm() + " " + data.getOfficetelCharterDto().getJibun())
////                    .charter_rate(charterRate)
////                    .back_taxes(0L)
////                    .risk(0L)
//                    .build();
//        }).collect(Collectors.toList());
//
//        officetelSearchRepository.saveAll(officetelEntities);
//
//        // 저장된 데이터를 OfficetelDto 리스트로 변환 후 반환
//        return officetelEntities.stream().map(officetel ->
//                new OfficetelDocument(officetel.getOffiNm(), officetel.getAddress(), officetel.getSggNm())
////                        , officetel.getSggNm(),
////                        officetel.getUmdNm(), officetel.getJibun(), officetel.getDeposit(), officetel.getFloor(),
////                        officetel.getBuildYear(), officetel.getExcluUseAr(), officetel.getContractTerm(),
////                        officetel.getMonthlyRent(), officetel.getCharter_rate(), officetel.getBack_taxes(),
////                        officetel.getRisk())
//        ).collect(Collectors.toList());
//    }

//    @Transactional
//    public List<OfficetelDocument> searchBySggNm(String sggNm) {
//        return officetelSearchRepository.findBySggNm(sggNm);
//    }

//    @Transactional
//    public List<OfficetelDocument> searchByUmdNm(String umdNm) {
//        return officetelSearchRepository.findByUmdNm(umdNm);
//    }
}
