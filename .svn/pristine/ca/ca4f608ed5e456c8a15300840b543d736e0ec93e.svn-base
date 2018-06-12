package crypto;
import beans.User;

public class Encrypt {
	
	public static String generatePassword(User user) {
		String password = user.getEmail() + user.getLogin() + user.getName();
		return Hash.sha265(password);
	}
	
	public static String encrypt(String data, User user) {
		String password = generatePassword(user);
		return AES256.encrypt(data, password);
	}
	
}
