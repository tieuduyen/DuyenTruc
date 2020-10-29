package controller;

import entity.CityEntity;
import entity.HotelEntity;
import entity.RoomTypeEntity;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import repository.AdvantagesRepository;
import repository.BookingDetailsRepository;
import repository.BookingRepository;
import repository.CityRepository;
import repository.CommentRepository;
import repository.HotelRepository;
import repository.RateRepository;
import repository.RoomRepository;
import repository.RoomTypeRepository;
import repository.SlideRepository;
import repository.UsersRepository;

@Controller
public class EditController {

    @Autowired
    CityRepository cityRepo;

    @Autowired
    AdvantagesRepository advantagesRepo;

    @Autowired
    HotelRepository hotelRepo;

    @Autowired
    RoomTypeRepository roomTypeRepo;

    @Autowired
    RoomRepository roomRepo;

    @Autowired
    RateRepository rateRepo;

    @Autowired
    SlideRepository slideRepo;

    @Autowired
    BookingRepository bookingRepo;

    @Autowired
    BookingDetailsRepository bookingDetailsRepo;

    @Autowired
    UsersRepository usersRepo;

    @Autowired
    CommentRepository commentRepo;

    //------------------------------------- Edit City By ID ------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/edit-city/{id}", method = RequestMethod.GET)
    public String showEditCityPage(@PathVariable(value = "id") int id, Model model) {

        CityEntity city = cityRepo.findById(id);

        model.addAttribute("city", city);

        return "edit/editCityPage";
    }

    //Save City
    @RequestMapping(value = "/update-city", method = RequestMethod.POST)
    public String updateHotel(CityEntity city,
            @RequestParam("file") MultipartFile file, Model model) {

        try {
            byte[] bytes = file.getBytes();
            // Creating the directory to store file
            String pathName1 = "E:\\CNTT\\Spring Framework\\test\\HotelAdmin\\src\\main\\webapp\\resources\\theme\\images";
            File dir1 = new File(pathName1);
            if (!dir1.exists()) {
                dir1.mkdirs();
            }

            String pathName2 = "E:\\CNTT\\Spring Framework\\test\\HotelApp\\src\\main\\webapp\\resources\\theme\\images";
            File dir2 = new File(pathName2);
            if (!dir2.exists()) {
                dir2.mkdirs();
            }

            // Create the file on server
            String fileSource1 = dir1.getAbsolutePath() + File.separator
                    + file.getOriginalFilename();
            File serverFile1 = new File(fileSource1);
            BufferedOutputStream stream1
                    = new BufferedOutputStream(new FileOutputStream(serverFile1));
            stream1.write(bytes);
            stream1.close();
            
            String fileName = file.getOriginalFilename();
            //model.addAttribute("filename", fileName);

            city.setCityImages(fileName);
            model.addAttribute("city", city);
            cityRepo.save(city);
            return "redirect:/view-city-list/1";
        } catch (Exception e) {
            System.out.println(e);
            return "redirect:/view-city-list/1";
        }
    }

    //---------------------------------- Edit Hotel By ID --------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/edit-hotel/{id}", method = RequestMethod.GET)
    public String showEditHotelPage(@PathVariable(value = "id") int id, Model model) {
        HotelEntity hotel = hotelRepo.findById(id);

        model.addAttribute("hotel", hotel);
        setCityDropdowList(model);

        return "edit/editHotelPage";
    }

    //Dropdow cua Category
    private void setCityDropdowList(Model model) {
        List<CityEntity> cityList = (List<CityEntity>) cityRepo.findAll();
        if (!cityList.isEmpty()) {
            Map<Integer, String> cityMap = new LinkedHashMap<>();
            for (CityEntity city : cityList) {
                cityMap.put(city.getId(), city.getName());
            }
            model.addAttribute("cityList", cityMap);
        }
    }

    //Save Hotel
    @RequestMapping(value = "/update-hotel", method = RequestMethod.POST)
    public String updateHotel( @RequestParam("file") MultipartFile file,HotelEntity hotel,Model model) {

        try {
            byte[] bytes = file.getBytes();
            // Creating the directory to store file
            String pathName1 = "E:\\CNTT\\Spring Framework\\test\\HotelAdmin\\src\\main\\webapp\\resources\\theme\\images";
            File dir1 = new File(pathName1);
            if (!dir1.exists()) {
                dir1.mkdirs();
            }

            String pathName2 = "E:\\CNTT\\Spring Framework\\test\\HotelApp\\src\\main\\webapp\\resources\\theme\\images";
            File dir2 = new File(pathName2);
            if (!dir2.exists()) {
                dir2.mkdirs();
            }

            // Create the file on server
            String fileSource1 = dir1.getAbsolutePath() + File.separator
                    + file.getOriginalFilename();
            File serverFile1 = new File(fileSource1);
            BufferedOutputStream stream1
                    = new BufferedOutputStream(new FileOutputStream(serverFile1));
            stream1.write(bytes);
            stream1.close();
            
            String fileName = file.getOriginalFilename();
            //model.addAttribute("filename", fileName);

            hotel.setImages(fileName);
            model.addAttribute("hotel", hotel);
            hotelRepo.save(hotel);
            return "redirect:/view-all-hotel/1";
        } catch (Exception e) {
            System.out.println(e);
            return "redirect:/view-all-hotel/1";
        }

    }

    //------------------------------------ Edit Room Type By ID---------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/edit-room-type/{id}", method = RequestMethod.GET)
    public String showEditRoomTypePage(@PathVariable(value = "id") int id, Model model) {
        RoomTypeEntity roomType = roomTypeRepo.findById(id);
        model.addAttribute("roomType", roomType);

        return "edit/editRoomTypePage";
    }

    //Save Room Type
    @RequestMapping(value = "/update-room-type", method = RequestMethod.POST)
    public String updateHotel(RoomTypeEntity roomType) {

        roomTypeRepo.save(roomType);

        return "redirect:/view-all-hotel/1";
    }
}
