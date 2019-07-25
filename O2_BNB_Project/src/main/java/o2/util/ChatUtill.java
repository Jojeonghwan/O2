package o2.util;

import java.util.List;

public class ChatUtill {
	String type;
	String message;
	String list;
	
	public String split(List<String> mem) {
		String list = "";
		
		for(int i=0; i<mem.size(); i++) {
			list += "<a href='#none' onclick=\"insertWisper('"+mem.get(i)+"')\">";
			list += mem.get(i);
			list += "</a>";
		}
		return list;
	}
}
