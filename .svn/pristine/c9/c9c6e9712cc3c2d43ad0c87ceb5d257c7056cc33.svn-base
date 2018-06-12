package domotique;

import crypto.AES256;

public class testCrypto {

	public static void main(String[] argv) {
		String aencoder = "J'essaie d'encoder cette merde";
			String encrypted = AES256.encrypt(aencoder, "mon mot de passe");
			System.out.println(encrypted);
			String decrypted = AES256.decrypt(encrypted, "mon mot de passe");
			System.out.println(decrypted);
	}
}