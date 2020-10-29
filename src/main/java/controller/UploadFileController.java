package controller;

import entity.CityEntity;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadFileController {
    
    @RequestMapping(value = "/uploadFile", method = RequestMethod.GET)
    public String addNewFile(Model model) {

        return "addNew/uploadFile";
    }
    
    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)
    public String uploadFile(@RequestParam("cityImages") MultipartFile cityImages, Model model){
        try {
            byte[] bytes = cityImages.getBytes();
            // Creating the directory to store file
            String pathName = "E:\\CNTT\\Spring Framework\\test\\HotelAdmin\\src\\main\\webapp\\resources\\theme\\images";
            File dir = new File(pathName);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // Create the file on server
            String fileSource = dir.getAbsolutePath() + File.separator 
                    + cityImages.getOriginalFilename();
            File serverFile = new File(fileSource);
            BufferedOutputStream stream = 
                    new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            String message="You uploaded successfully a file, at : " + fileSource;
            String fileName = cityImages.getOriginalFilename();
            model.addAttribute("message", message);
            model.addAttribute("filename", fileName);
        } catch (Exception e) {
            System.out.println(e);
            model.addAttribute("message", "Error when uploading file"+ e);          
        }
        return "redirect:/view-city-list/1";
    }
}
