package spring.prop;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GlobalProperties {
	private static final Logger LOGGER = LoggerFactory.getLogger(GlobalProperties.class);
	
	final static String FILE_SEPARATOR = System.getProperty("file.separator");
	public static final String RELATIVE_PATH_PREFIX = GlobalProperties.class.getResource("").getPath().substring(0, GlobalProperties.class.getResource("").getPath().lastIndexOf("prop"));
	public static final String GLOBALS_PROPERTIES_FILE = RELATIVE_PATH_PREFIX + FILE_SEPARATOR + "globals.properties";
	
	public static String getProperty(String keyName) {
		String value = "";
		
		LOGGER.debug("getProperty : {} = {}", GLOBALS_PROPERTIES_FILE, keyName);
		FileInputStream is = null;
		try {
			Properties props = new Properties();
			is = new FileInputStream(GLOBALS_PROPERTIES_FILE);
			
			props.load(new BufferedInputStream(is));
			if(props.getProperty(keyName)==null) {
				return "";
			}
			is.close();
			
			value = props.getProperty(keyName).trim();
			return value;
		} catch (FileNotFoundException fe) {
			LOGGER.debug("FileNotFoundException", fe);
			throw new RuntimeException(fe);
		} catch (IOException ioe) {
			LOGGER.debug("IOException", ioe);
			throw new RuntimeException(ioe);
		}
	}
	
	public static ArrayList<Map<String, String>> loadPropertyFile(String property) {
		
		ArrayList<Map<String, String>> keyList = new ArrayList<Map<String, String>>();
		String src = property.replace('\\', File.separatorChar).replace('/', File.separatorChar);
		FileInputStream is = null;
		try {
			File srcFile = new File(src);
			if (srcFile.exists()) {
				Properties props = new Properties();
				is = new FileInputStream(src);
				props.load(new BufferedInputStream(is));
				is.close();
				
				Enumeration<?> proplist = props.propertyNames();
				if(proplist != null) {
					while(proplist.hasMoreElements()) {
						Map<String, String> map = new HashMap<>();
						String key = (String) proplist.nextElement();
						map.put(key, props.getProperty(key));
						keyList.add(map);
					}
				}
			}
			return keyList;
		} catch (IOException ioe) {
			LOGGER.debug("IOException", ioe);
			throw new RuntimeException(ioe);
		}
	}
}
