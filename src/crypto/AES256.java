package crypto;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;

public class AES256 {
	
	public static final String CIPHER_ALGORITHM = "AES";
    public static final String KEY_ALGORITHM = "AES";
    public static final String PASS_HASH_ALGORITHM = "SHA-256";

    public static String encrypt(String data, String password) {
        try {
            Cipher cipher = buildCipher(password, Cipher.ENCRYPT_MODE);
            byte[] dataToSend = data.getBytes(Charset.forName("UTF-8"));
            byte[] encryptedData = cipher.doFinal(dataToSend);
            return Converter.bytesToHex(encryptedData).toLowerCase();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String decrypt(String encryptedValue, String password) {
        try {
            Cipher cipher = buildCipher(password, Cipher.DECRYPT_MODE);
            byte[] encryptedData = Converter.hexToBytes(encryptedValue);
            byte[] data = cipher.doFinal(encryptedData);
            return new String(data, Charset.forName("UTF-8"));

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static Cipher buildCipher(String password, int mode) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, UnsupportedEncodingException {
        Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
        Key key = buildKey(password);
        cipher.init(mode, key);
        return cipher;
    }

    private static Key buildKey(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digester = MessageDigest.getInstance(PASS_HASH_ALGORITHM);
        digester.update(String.valueOf(password).getBytes(Charset.forName("UTF-8")));
        byte[] key = digester.digest();
        return new SecretKeySpec(key, KEY_ALGORITHM);
    }
	
}
