package com.millky.m3.controller.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import lombok.extern.slf4j.Slf4j;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
public class DefaultController
{
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String root(HttpServletRequest request)
	{
		return "basePage";
	}

	@RequestMapping("/default/**/*")
	public void defaultRequest(Device device) throws IOException
	{
		if (device.isMobile())
		{
			log.info("Hello mobile user!");
		}
		else if (device.isTablet())
		{
			log.info("Hello tablet user!");
		}
		else
		{
			log.info("Hello desktop user!");
		}
	}
}
