package com.example.admin.web;

import com.example.entity.Book;
import com.example.entity.Category;
import com.example.pager.PageBean;
import com.example.service.BookService;
import com.example.service.CategoryService;
import com.example.util.commons.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;

@Controller
@RequestMapping("/admin/book")
public class AdminBookController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/addBook.do", method = RequestMethod.POST)
    public String addBook(ModelMap map, @RequestParam MultipartFile[] fileItem,
                          Book book, Category category, HttpServletRequest request) throws IOException {
        book.setCategory(category);
        if (fileItem[0].getSize() <= 0) {
            map.addAttribute("msg", "您还未上传图书大图！");
            map.addAttribute("parents", categoryService.findParents());
            return "/adminjsps/admin/book/add";
        }
        String filename = fileItem[0].getOriginalFilename();
        filename = CommonUtil.uuid() + "_" + filename;
        if (!filename.toLowerCase().endsWith(".jpg")) {
            map.addAttribute("msg", "上传的文件扩展名必须是.jpg格式的");
            map.addAttribute("parents", categoryService.findParents());
            return "/adminjsps/admin/book/add";
        }

        //获取文件路径
        ServletContext context = request.getServletContext();
        String savepath = context.getRealPath("/book_img");
        //3.解决同一文件夹中文件过多问题
        //String datePath = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        //4.判断路径是否存在
        File file = new File(savepath);
        if (!file.exists()) {
            file.mkdirs();
        }
        File destFile = new File(savepath, filename);
        fileItem[0].transferTo(destFile);
        //判断图片尺寸
        ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
        Image image = icon.getImage();
        if (image.getWidth(null) > 350 || image.getHeight(null) > 350) {
            map.addAttribute("msg", "您上传的图片尺寸超出了350*350");
            map.addAttribute("parents", categoryService.findParents());
            destFile.delete();
            return "/adminjsps/admin/book/add";
        }
        //把大图图片的路径设置给Book对象
        book.setImage_w("book_img/" + filename);


        if (fileItem[1].getSize() <= 0) {
            map.addAttribute("msg", "您还未上传图书小图！");
            map.addAttribute("parents", categoryService.findParents());
            return "/adminjsps/admin/book/add";
        }
        filename = fileItem[1].getOriginalFilename();
        filename = CommonUtil.uuid() + "_" + filename;
        if (!filename.toLowerCase().endsWith(".jpg")) {
            map.addAttribute("msg", "上传的文件扩展名必须是.jpg格式的");
            map.addAttribute("parents", categoryService.findParents());
            return "/adminjsps/admin/book/add";
        }
        destFile = new File(savepath, filename);
        fileItem[1].transferTo(destFile);
        //判断图片尺寸
        icon = new ImageIcon(destFile.getAbsolutePath());
        image = icon.getImage();
        if (image.getWidth(null) > 350 || image.getHeight(null) > 350) {
            map.addAttribute("msg", "您上传的图片尺寸超出了350*350");
            map.addAttribute("parents", categoryService.findParents());
            destFile.delete();
            return "/adminjsps/admin/book/add";
        }
        //把小图图片的路径设置给Book对象
        book.setImage_b("book_img/" + filename);

        //添加图书到数据库
        book.setBid(CommonUtil.uuid());
        bookService.addBook(book);
        map.addAttribute("msg", "添加图书成功！");

        return "/adminjsps/msg";
    }

    @RequestMapping("/delete.do")
    public String delete(ModelMap map, String bid, HttpServletRequest request) throws IOException {
        Book book = bookService.load(bid);
        ServletContext context = request.getServletContext();
        String savepath = context.getRealPath("/book_img");
        new File(savepath, book.getImage_w().substring(book.getImage_w().lastIndexOf("/"))).delete();
        new File(savepath, book.getImage_b().substring(book.getImage_w().lastIndexOf("/"))).delete();
        bookService.delete(bid);
        map.addAttribute("msg", "删除成功！");
        return "/adminjsps/msg";
    }

    @RequestMapping("/edit.do")
    public String edit(ModelMap map, Book book, Category category) {
        book.setCategory(category);
        System.out.println("book:" + book);
        bookService.edit(book);
        map.addAttribute("msg", "修改图书成功！");
        return "/adminjsps/msg";
    }

    @RequestMapping("/findCategoryAll")
    public String findCategoryAll(ModelMap map) {
        List<Category> parents = categoryService.findAll();
        map.addAttribute("parents", parents);
        return "/adminjsps/admin/index";
    }

    @RequestMapping("/load.do")
    public String load(ModelMap map, String bid) {
        Book book = bookService.load(bid);
        map.addAttribute("book", book);
        map.addAttribute("parents", categoryService.findParents());
        String pid = book.getCategory().getParent().getCid();
        map.addAttribute("children", categoryService.findByParent(pid));
        return "/adminjsps/admin/book/desc";
    }

    private int getPc(HttpServletRequest request) {
        int pc = 1;
        String param = request.getParameter("pc");
        if (param != null && !param.trim().isEmpty()) {
            try {
                pc = Integer.parseInt(param);
            } catch (RuntimeException e) {
            }
        }
        return pc;
    }

    private String getUrl(HttpServletRequest request) {
        String url = request.getRequestURI() + "?" + request.getQueryString();
        int index = url.lastIndexOf("&pc=");
        if (index != -1) {
            url = url.substring(0, index);
        }
        return url;
    }

    @RequestMapping("/findByCategory.do")
    public String findByCategory(HttpServletRequest request) {
        int pc = getPc(request);
        String url = getUrl(request);
        String cid = request.getParameter("cid");
        PageBean<Book> pb = bookService.findByCategory(cid, pc);
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "/adminjsps/admin/book/list";
    }

    @RequestMapping("/findByAuthor.do")
    public String findByAuthor(HttpServletRequest request) {
        int pc = getPc(request);
        String url = getUrl(request);
        String author = request.getParameter("author");
        PageBean<Book> pb = bookService.findByAuthor(author, pc);
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "/adminjsps/admin/book/list";
    }

    @RequestMapping("/findByPress.do")
    public String findByPress(HttpServletRequest request) {
        int pc = getPc(request);
        String url = getUrl(request);
        String press = request.getParameter("press");
        PageBean<Book> pb = bookService.findByPress(press, pc);
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "/adminjsps/admin/book/list";
    }

    @RequestMapping("/findByBname.do")
    public String findByBname(HttpServletRequest request) {
        int pc = getPc(request);
        String url = getUrl(request);
        String bname = request.getParameter("bname");
        PageBean<Book> pb = bookService.findByBname(bname, pc);
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "/adminjsps/admin/book/list";
    }

    @RequestMapping("/findByConbination.do")
    public String findByConbination(HttpServletRequest request, Book book) {
        int pc = getPc(request);
        String url = getUrl(request);
        PageBean<Book> pb = bookService.findByConbination(book, pc);
        pb.setUrl(url);
        request.setAttribute("pb", pb);
        return "/adminjsps/admin/book/list";
    }

    @RequestMapping("/addPre.do")
    public String addPre(ModelMap map) {
        List<Category> parents = categoryService.findParents();
        map.addAttribute("parents", parents);
        return "/adminjsps/admin/book/add";
    }

    @RequestMapping("/ajaxFindChildren.do")
    @ResponseBody
    public List<Category> ajaxFindChildren(String pid) {
        List<Category> children = categoryService.findByParent(pid);
        return children;
    }

}
