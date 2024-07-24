package test001.common.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bootstrapTemplate")
public class bootstrapTemplateController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(bootstrapTemplateController.class);
	
	@RequestMapping("/index")
	public String index() {
		LOGGER.info("/html/bootstrapTemplate/index.html");
		 return "bootstrapTemplate/index.htm-layout";
	}
	
	@RequestMapping("/buttons")
	public String buttons() {
		LOGGER.info("/html/bootstrapTemplate/buttons.html");
		 return "bootstrapTemplate/buttons.htm-layout";
	}
	
	@RequestMapping("/cards")
	public String cards() {
		LOGGER.info("/html/bootstrapTemplate/cards.html");
		 return "bootstrapTemplate/cards.htm-layout";
	}
	
	@RequestMapping("/utilities-color")
	public String utilitiesColor() {
		LOGGER.info("/html/bootstrapTemplate/utilities-color.html");
		 return "bootstrapTemplate/utilities-color.htm-layout";
	}
	
	@RequestMapping("/utilities-border")
	public String utilitiesBorder() {
		LOGGER.info("/html/bootstrapTemplate/utilities-border.html");
		 return "bootstrapTemplate/utilities-border.htm-layout";
	}
	
	@RequestMapping("/utilities-animation")
	public String utilitiesAnimation() {
		LOGGER.info("/html/bootstrapTemplate/utilities-animation.html");
		 return "bootstrapTemplate/utilities-animation.htm-layout";
	}
	
	@RequestMapping("/utilities-other")
	public String utilitiesOther() {
		LOGGER.info("/html/bootstrapTemplate/utilities-other.html");
		 return "bootstrapTemplate/utilities-other.htm-layout";
	}
	
	@RequestMapping("/login")
	public String login() {
		LOGGER.info("/html/bootstrapTemplate/login.html");
		 return "bootstrapTemplate/login.htm-layout";
	}
	
	@RequestMapping("/register")
	public String register() {
		LOGGER.info("/html/bootstrapTemplate/register.html");
		 return "bootstrapTemplate/register.htm-layout";
	}
	
	@RequestMapping("/forgot-password")
	public String forgotPassword() {
		LOGGER.info("/html/bootstrapTemplate/forgot-password.html");
		 return "bootstrapTemplate/forgot-password.htm-layout";
	}
	
	@RequestMapping("/404")
	public String Page404() {
		LOGGER.info("/html/bootstrapTemplate/404.html");
		 return "bootstrapTemplate/404.htm-layout";
	}
	
	@RequestMapping("/blank")
	public String blank() {
		LOGGER.info("/html/bootstrapTemplate/blank.html");
		 return "bootstrapTemplate/blank.htm-layout";
	}
	
	@RequestMapping("/charts")
	public String charts() {
		LOGGER.info("/html/bootstrapTemplate/charts.html");
		 return "bootstrapTemplate/charts.htm-layout";
	}
	
	@RequestMapping("/tables")
	public String tables() {
		LOGGER.info("/html/bootstrapTemplate/tables.html");
		 return "bootstrapTemplate/tables.htm-layout";
	}
	
	
}
