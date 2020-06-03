package com;

import java.security.MessageDigest;
import java.security.SecureRandom;

public class Util {
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
			//java ��Integer.toHexString�|�۰ʬٲ����䪺�s �ҥH�������k�U4bits
			int l = (int)(b >> 4) & 0xf;//�̰��줸��1�ɬ��t�� �নint(32bits)���줸�|�X�{�ܦh1 �ҥH�ݭn�B�n����4bits
			int r = (int)b & 0xf;

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
