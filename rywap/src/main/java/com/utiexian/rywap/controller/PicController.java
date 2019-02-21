package com.utiexian.rywap.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.ry.core.util.Constant;

/**
 * 公用方法（图片上传等）
 * @author WKX
 */
@Controller
@RequestMapping("/wap/pic")
public class PicController {

	/**
	 * 上传图片
	 * @author WKX
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/uploadpic")
	public @ResponseBody void uploadpic(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String savePath = Constant.properties.getProperty("uploadpath") + Constant.TEMP_PATH;//文件保存目录路径
		String showUrl = Constant.properties.getProperty("preimgUrl") + Constant.TEMP_PATH;//文件保存目录URL

		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");//定义允许上传的文件扩展名

		long maxSize = 100 * 1024 * 1024;//最大文件大小
		response.setContentType("text/html; charset=UTF-8");
		if (!ServletFileUpload.isMultipartContent(request)) {
			out.print("请选择文件。");
			return;
		}
		File uploadDir = new File(savePath);
		if (!uploadDir.isDirectory()) {//检查目录
			uploadDir.mkdirs();
		}
		if (!uploadDir.canWrite()) {//检查目录写权限
			out.print("上传目录没有写权限。");
			return;
		}
		String dirName = request.getParameter("dir");
		if (dirName == null) {
			dirName = "image";
		}
		if (!extMap.containsKey(dirName)) {
			out.print("目录名不正确。");
			return;
		}
		savePath += dirName + "/";
		showUrl += dirName + "/";
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {//创建文件夹
			saveDirFile.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		showUrl += ymd + "/";
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");

		DefaultMultipartHttpServletRequest mrequest = (DefaultMultipartHttpServletRequest) request;
		Map<?, MultipartFile> map = mrequest.getFileMap();
		Collection<MultipartFile> c = map.values();
		Iterator<MultipartFile> it = c.iterator();
		for (; it.hasNext();) {
			CommonsMultipartFile file = (CommonsMultipartFile) it.next();
			if (!file.isEmpty()) {
				long fileSize = file.getSize();
				String fileName = file.getOriginalFilename();
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

				if (fileSize > maxSize) {
					out.println("上传文件大小超过限制100M。");
					return;
				}
				if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(fileExt)) {
					out.println("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
					return;
				}
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
				try {
					File uploadedFile = new File(savePath, newFileName);
					file.transferTo(uploadedFile);
					out.print(showUrl + newFileName);
					out.close();
				} catch (Exception e) {
					out.println("上传文件失败。");
					return;
				}
			} else {
				out.println("不可以上传空文件！");
				return;
			}
		}
	}
}