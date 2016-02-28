package com.tanlan.cdetc.utils;

import java.util.HashMap;
import java.util.Map;

public class AuthCodes {
	public static final Map<String,Integer> codes=new HashMap<>();
	static{
		codes.put("ROLE_QUERY",1011);
		codes.put("ROLE_ADD",1012);
		codes.put("ROLE_UPDATE",1013);
		codes.put("ROLE_DELETE",1014);
	}
}
