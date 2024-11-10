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

@Service
@RequiredArgsConstructor
public class OfficetelServiceImpl implements OfficetelService{

    private final DataMapper dataMapper;
    private final OfficetelRepository officetelRepository;

    @Override
    @Transactional
    public List<OfficetelDto> saveOfficetelData(List<CharterDto> charterList, List<TradeDto> tradeList) {
        List<OfficetelDataDto> mappedData = dataMapper.mapRentAndTrade(charterList, tradeList);

        for(OfficetelDataDto data : mappedData) {
            long charterPrice = Long.parseLong(data.getCharterDto().getDeposit().replace(",", ""));
            long tradePrice = Long.parseLong(data.getTradeDto().getDealAmount().replace(",", ""));
            double charterRate = (charterPrice / tradePrice) * 100; // 전세가율 계산

            Officetel officetel = Officetel.builder()
                    .o_name(data.getCharterDto().getOffiNm()) // 오피스텔 이름
                    .o_address(data.getCharterDto().getSggNm() + " " + data.getCharterDto().getUmdNm() + " " + data.getCharterDto().getJibun())
                    .price(charterPrice)
                    .charter_rate(charterRate)
                    .back_texes(0L)
                    .risk(0L)
                    .build();
            officetelRepository.save(officetel);
        }
        return saveOfficetelData(charterList, tradeList);
    }
}
