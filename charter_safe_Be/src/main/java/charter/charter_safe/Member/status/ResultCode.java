package charter.charter_safe.Member.status;

import lombok.Getter;

@Getter
public enum ResultCode {
    SUCCESS(1, "정상 처리"),
    ERROR(0, "에러 발생");

    private final int result;
    private final String msg;

    ResultCode(int result, String msg) {
        this.result = result;
        this.msg = msg;
    }
}
