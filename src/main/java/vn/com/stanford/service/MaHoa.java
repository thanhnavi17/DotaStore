package vn.com.stanford.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MaHoa {
	public static String maHoa(String password){
        String kq = "";
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(password.getBytes());
            BigInteger bigI = new BigInteger(1,digest.digest());
            kq = bigI.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return kq;
    }
}
