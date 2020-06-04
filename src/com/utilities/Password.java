package com.utilities;


import java.security.MessageDigest;
import java.security.SecureRandom;

public class Password {
	public static void main(String args[]) {
		byte b = -128;
		System.out.println(Integer.toString((int)b, 2));
		System.out.println((byte)(b >>> 1));
		System.out.println(Integer.toString((int)b, 2));
	}
	
	/**
	 * 
	 * @param rawP
	 * @return String[]{hashedP,salt}
	 */
	public static String[] hashPassword(String rawP) {
		String hashedP="";
		String salt="";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] bsalt = getSalt();
			md.update(bsalt);
			byte[] bPw = md.digest(rawP.getBytes());
			
			hashedP = bytesToHexString(bPw);
			System.out.println("hashedP : "+hashedP);
			salt = bytesToHexString(bsalt);
			System.out.println("salt \t: "+salt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new String[] {hashedP, salt};
	}
	
	private static byte[] getSalt() {

		        byte[] salt = new byte[32];
			try {

			        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG", "SUN");

			        sr.nextBytes(salt);

			} catch (Exception e) {
				e.printStackTrace();
			}
		        return salt;
	}
	public static String bytesToHexString(byte[] bb) {
		StringBuilder sb = new StringBuilder();
		for(byte b :bb) {
			//java 的Integer.toHexString會省略左邊的0 所以分成左右各4bits
			int l = (b >>> 4) & 0xf;//java的byte 在做位元運算時會先轉成int ,如果b最高位元為一表示是負數轉成int後左邊會出現連續的1,所以需要一個遮罩維持4bits
			int r = b & 0xf;

			sb.append(Integer.toHexString(l));
			sb.append(Integer.toHexString(r));
		}
		return sb.toString();
	}
	public static byte[] hexStringToBytes(String hex) {
		char c[] = hex.toCharArray();
		byte[] output = new byte[hex.length()/2];
		int left,right;
		for(int i = 0 ; i < output.length ;  i ++) {
			left	= Character.digit(c[2*i]	, 16);
			right= Character.digit(c[2*i+1]	, 16);
			output[i] =(byte)( left << 4 | right);
		}
		return output;
	}
}
