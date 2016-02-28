package com.tanlan.cdetc.utils;

import java.util.UUID;

public class EtcUtils {
	public static String getId() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replaceAll("-", "");
	}

	public static boolean isEmpty(String s) {
		return s == null || s.trim().equals("");
	}

	public static boolean isNotEmpty(String s) {
		return !isEmpty(s);
	}
}
