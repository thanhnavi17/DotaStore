package vn.com.stanford.entity;

public enum HanhDongEnum {
	THEMMOI(1), SUA(2), XOA(3);

	private int value;

	private HanhDongEnum(int value) {
		this.value = value;
	}
	
	public int getValue() {
        return value;
    }
	
}



