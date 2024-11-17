package charter.charter_safe.Apt.a_service;

import charter.charter_safe.Apt.a_domain.Apt;
import charter.charter_safe.Apt.a_dto.AptCharterDto;
import charter.charter_safe.Apt.a_dto.AptDataDto;
import charter.charter_safe.Apt.a_dto.AptDto;
import charter.charter_safe.Apt.a_dto.AptTradeDto;
import charter.charter_safe.Apt.a_repo.AptRepository;
import charter.charter_safe.Officetel.o_domain.Officetel;
import charter.charter_safe.Officetel.o_dto.OfficetelCharterDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDataDto;
import charter.charter_safe.Officetel.o_dto.OfficetelDto;
import charter.charter_safe.Officetel.o_dto.OfficetelTradeDto;
import charter.charter_safe.Officetel.o_repo.OfficetelRepository;
import charter.charter_safe.Officetel.o_service.DataMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AptServiceImpl implements AptService{
    private final AptDataMapper aptDataMapper;
    private final AptRepository aptRepository;

    @Override
    @Transactional
    public List<AptDto> saveAptData(List<AptCharterDto> charterList, List<AptTradeDto> tradeList) {
        List<AptDataDto> mappedData = aptDataMapper.mapRentAndTrade(charterList, tradeList);

        // Apt 엔티티로 변환 후 저장
        List<Apt> aptEntities = mappedData.stream().map(data -> {
            long charterPrice = Long.parseLong(data.getAptCharterDto().getDeposit().replace(",", ""));
            long tradePrice = Long.parseLong(data.getAptTradeDto().getDealAmount().replace(",", ""));
            double aptCharterRate = (charterPrice / (double) tradePrice) * 100; // 전세가율 계산

            return Apt.builder()
                    .aptNm(data.getAptCharterDto().getAptNm()) // 오피스텔 이름
                    .umdNm(data.getAptCharterDto().getUmdNm())
                    .sggNm(data.getAptTradeDto().getSggNm())
                    .jibun(data.getAptCharterDto().getJibun())
                    .floor(data.getAptCharterDto().getFloor())
                    .buildYear(data.getAptCharterDto().getBuildYear())
                    .excluUseAr(data.getAptCharterDto().getExcluUseAr())
                    .contractTerm(data.getAptCharterDto().getContractTerm())
                    .address(data.getAptTradeDto().getSggNm() + " " + data.getAptCharterDto().getUmdNm() + " " + data.getAptCharterDto().getJibun())
                    .deposit(charterPrice)
                    .charter_rate(aptCharterRate)
                    .back_taxes(0L)
                    .risk(0L)
                    .build();
        }).collect(Collectors.toList());

        aptRepository.saveAll(aptEntities);

        // 저장된 데이터를 AptDto 리스트로 변환 후 반환
        return aptEntities.stream().map(apt ->
                new AptDto(apt.getAptNm(), apt.getAddress(), apt.getSggNm(), apt.getUmdNm(), apt.getJibun(),
                        apt.getFloor(), apt.getBuildYear(), apt.getExcluUseAr(), apt.getContractTerm(), apt.getDeposit(),
                        apt.getCharter_rate(), apt.getBack_taxes(), apt.getRisk())
        ).collect(Collectors.toList());
    }
}
