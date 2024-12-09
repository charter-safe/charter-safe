//package charter.charter_safe.Officetel.o_service;
//
//import charter.charter_safe.Officetel.o_domain.Officetel;
//import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
//import charter.charter_safe.Officetel.o_dto.OfficetelDataDto;
//import charter.charter_safe.Officetel.o_dto.OfficetelDto;
//import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
//import charter.charter_safe.Officetel.o_repo.OfficetelRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.List;
//
//@Service
//@RequiredArgsConstructor
//public class OfficetelServiceImpl implements OfficetelService{
//
//    private final DataMapper dataMapper;
//    private final OfficetelRepository officetelRepository;
//
//    @Override
//    @Transactional
//    public List<OfficetelDto> saveOfficetelData(List<OfficetelCharterDto> charterList, List<OfficetelTradeDto> tradeList) {
//        List<OfficetelDataDto> mappedData = dataMapper.mapRentAndTrade(charterList, tradeList);
//
//        for(OfficetelDataDto data : mappedData) {
//            long charterPrice = Long.parseLong(data.getOfficetelCharterDto().getDeposit().replace(",", ""));
//            long tradePrice = Long.parseLong(data.getOfficetelTradeDto().getDealAmount().replace(",", ""));
//            double charterRate = (charterPrice / tradePrice) * 100; // 전세가율 계산
//
//            Officetel officetel = Officetel.builder()
//                    .o_name(data.getOfficetelCharterDto().getOffiNm()) // 오피스텔 이름
//                    .o_address(data.getOfficetelCharterDto().getSggNm() + " " + data.getOfficetelCharterDto().getUmdNm() + " " + data.getOfficetelCharterDto().getJibun())
//                    .price(charterPrice)
//                    .charter_rate(charterRate)
//                    .back_texes(0L)
//                    .risk(0L)
//                    .build();
//            officetelRepository.save(officetel);
//        }
//        return saveOfficetelData(charterList, tradeList);
//    }
//}


package charter.charter_safe.Officetel.o_service;

import charter.charter_safe.Officetel.o_domain.Officetel;
import charter.charter_safe.Officetel.o_domain.OfficetelDocument;
import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDataDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDto;
import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
import charter.charter_safe.Officetel.o_repo.OfficetelRepository;
import charter.charter_safe.Officetel.o_repo.OfficetelSearchRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OfficetelServiceImpl implements OfficetelService {

    private final DataMapper dataMapper;
    private final OfficetelRepository officetelRepository;
    private final ElasticsearchOperations elasticsearchOperations;
    private final OfficetelSearchRepository officetelSearchRepository;

    @Override
    @Transactional
    public List<OfficetelDto> saveOfficetelData(List<OfficetelCharterDto> charterList, List<OfficetelTradeDto> tradeList) {
        List<OfficetelDataDto> mappedData = dataMapper.mapRentAndTrade(charterList, tradeList);

        // Officetel 엔티티로 변환 후 저장
        List<Officetel> officetelEntities = mappedData.stream().map(data -> {
            long charterPrice = Long.parseLong(data.getOfficetelCharterDto().getDeposit().replace(",", ""));
            long tradePrice = Long.parseLong(data.getOfficetelTradeDto().getDealAmount().replace(",", ""));
            double charterRate = (charterPrice / (double) tradePrice) * 100; // 전세가율 계산

            return Officetel.builder()
                    .offiNm(data.getOfficetelCharterDto().getOffiNm()) // 오피스텔 이름
                    .sggNm(data.getOfficetelCharterDto().getSggNm())
                    .umdNm(data.getOfficetelCharterDto().getUmdNm())
                    .jibun(data.getOfficetelCharterDto().getJibun())
                    .floor(data.getOfficetelCharterDto().getFloor())
                    .buildYear(data.getOfficetelCharterDto().getBuildYear())
                    .excluUseAr(data.getOfficetelCharterDto().getExcluUseAr())
                    .contractTerm(data.getOfficetelCharterDto().getContractTerm())
                    .monthlyRent(data.getOfficetelCharterDto().getMonthlyRent())
                    .address(data.getOfficetelCharterDto().getSggNm() + " " + data.getOfficetelCharterDto().getUmdNm() + " " + data.getOfficetelCharterDto().getJibun())
                    .deposit(charterPrice)
                    .charter_rate(charterRate)
                    .back_taxes(0L)
                    .risk(0L)
                    .build();
        }).collect(Collectors.toList());

        officetelRepository.saveAll(officetelEntities);

        // 저장된 데이터를 OfficetelDto 리스트로 변환 후 반환
        return officetelEntities.stream().map(officetel ->
                new OfficetelDto(officetel.getOffiNm(), officetel.getAddress(), officetel.getSggNm(),
                        officetel.getUmdNm(), officetel.getJibun(), officetel.getFloor(), officetel.getBuildYear(),
                        officetel.getExcluUseAr(), officetel.getContractTerm(), officetel.getMonthlyRent(),
                        officetel.getDeposit(), officetel.getCharter_rate(),
                        officetel.getBack_taxes(), officetel.getRisk())
        ).collect(Collectors.toList());
    }
}
