package crypto;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	
	public static String sha265(String aencoder) {
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] hashByte = digest.digest(aencoder.getBytes(StandardCharsets.UTF_8));
		return Converter.bytesToHex(hashByte).toLowerCase();
	}
		
}