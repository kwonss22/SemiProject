package com.travelez.app.notice.util;

public class Utility {

	public static String arrow(int depth){
		String img = "<img src='../asset/images/arrow.png' width='20px' height='20px' />&nbsp;";	
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		
		String ts = "";
		for(int i = 0;i < depth; i++){
			ts += nbsp;
		}
		
		return depth==0?"":ts + img;
	}
}
