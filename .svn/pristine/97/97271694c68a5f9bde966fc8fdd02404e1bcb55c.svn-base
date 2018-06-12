package tests;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import crypto.Hash;

public class testSha256 {

	private String toHash;
	private String hash;
	private String concatenate;
	private String hashConcatenate;
	
	@Before
	public void setUp() {
		toHash = "testHash";
		concatenate = "toConcatenate";
		hash = "fdd8157ddd7d2ade12a3799aa9998a8de76d291c1f3ddce3b3bb7edb2f42c7a8";
		hashConcatenate = "e880237a8149114d7e9ca19701ed96dbe082b98fbd143fd3f61cbd80be7af4c5";
	}
	
	@Test
	public void testEquals() {
		assertEquals(Hash.sha265(toHash), hash);
	}
	
	@Test
	public void testConcatenate() {
		assertEquals(Hash.sha265(toHash+concatenate), hashConcatenate);
	}
}
