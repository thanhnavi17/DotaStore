package vn.com.stanford.entity;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter
public class HanhDongEnumConverter implements AttributeConverter<HanhDongEnum, Integer>{
	public Integer convertToDatabaseColumn(HanhDongEnum hanhDong) {
		if (hanhDong == null)
            return null;
 
        switch (hanhDong) {
        case THEMMOI:
            return 1;
 
        case SUA:
            return 2;
 
        case XOA:
            return 3;
 
        default:
            throw new IllegalArgumentException(hanhDong + " not supported.");
        }
	}
	public HanhDongEnum convertToEntityAttribute(Integer hanhDong) {
		 if (hanhDong == null)
	            return null;
	 
	        switch (hanhDong) {
	        case 1:
	            return HanhDongEnum.THEMMOI;
	 
	        case 2:
	            return HanhDongEnum.SUA;
	 
	        case 3:
	            return HanhDongEnum.XOA;
	 
	 
	        default:
	            throw new IllegalArgumentException(hanhDong + " not supported.");
	        }
	}

}
