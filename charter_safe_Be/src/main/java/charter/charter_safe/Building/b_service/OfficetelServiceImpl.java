//package charter.charter_safe.Building.b_service;
//
//import charter.charter_safe.Building.b_domain.Officetel;
//import charter.charter_safe.Building.b_dto.CharterDto;
//import charter.charter_safe.Building.b_dto.OfficetelDataDto;
//import charter.charter_safe.Building.b_dto.OfficetelDto;
//import charter.charter_safe.Building.b_dto.TradeDto;
//import charter.charter_safe.Building.b_repo.OfficetelRepository;
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
//    public List<OfficetelDto> saveOfficetelData(List<CharterDto> charterList, List<TradeDto> tradeList) {
//        List<OfficetelDataDto> mappedData = dataMapper.mapRentAndTrade(charterList, tradeList);
//
//        for(OfficetelDataDto data : mappedData) {
//            long charterPrice = Long.parseLong(data.getCharterDto().getDeposit().replace(",", ""));
//            long tradePrice = Long.parseLong(data.getTradeDto().getDealAmount().replace(",", ""));
//            double charterRate = (charterPrice / tradePrice) * 100; // 전세가율 계산
//
//            Officetel officetel = Officetel.builder()
//                    .o_name(data.getCharterDto().getOffiNm()) // 오피스텔 이름
//                    .o_address(data.getCharterDto().getSggNm() + " " + data.getCharterDto().getUmdNm() + " " + data.getCharterDto().getJibun())
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


package charter.charter_safe.Building.b_service;

import charter.charter_safe.Building.b_domain.Officetel;
import charter.charter_safe.Building.b_dto.CharterDto;
import charter.charter_safe.Building.b_dto.OfficetelDataDto;
import charter.charter_safe.Building.b_dto.OfficetelDto;
import charter.charter_safe.Building.b_dto.TradeDto;
import charter.charter_safe.Building.b_repo.OfficetelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OfficetelServiceImpl implements OfficetelService {

    private final DataMapper dataMapper;
    private final OfficetelRepository officetelRepository;

    @Override
    @Transactional
    public List<OfficetelDto> saveOfficetelData(List<CharterDto> charterList, List<TradeDto> tradeList) {
        List<OfficetelDataDto> mappedData = dataMapper.mapRentAndTrade(charterList, tradeList);

        // Officetel 엔티티로 변환 후 저장
        List<Officetel> officetelEntities = mappedData.stream().map(data -> {
            long charterPrice = Long.parseLong(data.getCharterDto().getDeposit().replace(",", ""));
            long tradePrice = Long.parseLong(data.getTradeDto().getDealAmount().replace(",", ""));
            double charterRate = (charterPrice / (double) tradePrice) * 100; // 전세가율 계산

            return Officetel.builder()
                    .offiNm(data.getCharterDto().getOffiNm()) // 오피스텔 이름
                    .sggNm(data.getCharterDto().getSggNm())
                    .umdNm(data.getCharterDto().getUmdNm())
                    .jibun(data.getCharterDto().getJibun())
                    .address(data.getCharterDto().getSggNm() + " " + data.getCharterDto().getUmdNm() + " " + data.getCharterDto().getJibun())
                    .deposit(charterPrice)
                    .charter_rate(charterRate)
                    .back_taxes(0L)
                    .risk(0L)
                    .build();
        }).collect(Collectors.toList());

        officetelRepository.saveAll(officetelEntities);

        // 저장된 데이터를 OfficetelDto 리스트로 변환 후 반환
        return officetelEntities.stream().map(officetel ->
                new OfficetelDto(officetel.getOffiNm(), officetel.getAddress(), officetel.getSggNm(), officetel.getUmdNm(), officetel.getJibun(), officetel.getDeposit(), officetel.getCharter_rate(), officetel.getBack_taxes(), officetel.getRisk())
        ).collect(Collectors.toList());
    }
}
