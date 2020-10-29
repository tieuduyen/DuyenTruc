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
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class AddNewController {

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

    //--------------------------------------- Add New City -------------------------------------------
    //------------------------------------------------------------------------------------------------    
    @RequestMapping(value = "/addNewCity", method = RequestMethod.GET)
    public String addNewCityPage(Model model) {

        model.addAttribute("city", new CityEntity());

        return "addNew/addNewCityPage";
    }

    //save new city
    @RequestMapping(value = "/addNewCity", method = RequestMethod.POST)
    public String saveNewCity(@RequestParam("file") MultipartFile file,
            CityEntity city, Model model) {
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

            String fileSource2 = dir2.getAbsolutePath() + File.separator
                    + file.getOriginalFilename();
            File serverFile2 = new File(fileSource2);
            BufferedOutputStream stream2
                    = new BufferedOutputStream(new FileOutputStream(serverFile2));
            stream2.write(bytes);
            stream2.close();

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

    //------------------------------------- Add New Hotel --------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/addNewHotel", method = RequestMethod.GET)
    public String addNewHotelPage(Model model) {

        //CityEntity city = cityRepo.findById(id);
        //model.addAttribute("city",city);
        model.addAttribute("hotel", new HotelEntity());
        setCityDropdowList(model);

        return "addNew/addNewHotelPage";
    }

    //Dropdow City
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

    // save new hotel
    @RequestMapping(value = "/addNewHotel", method = RequestMethod.POST)
    public String saveNewHotel(@RequestParam("file") MultipartFile file,
            HotelEntity hotel, Model model) {
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

            String fileSource2 = dir2.getAbsolutePath() + File.separator
                    + file.getOriginalFilename();
            File serverFile2 = new File(fileSource2);
            BufferedOutputStream stream2
                    = new BufferedOutputStream(new FileOutputStream(serverFile2));
            stream2.write(bytes);
            stream2.close();

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

    //------------------------------------ Add New Room Type -----------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/addNewRoomType/{id}", method = RequestMethod.GET)
    public String addNewRoomTypePage(@PathVariable int id, Model model) {

        //HotelEntity hotel = hotelRepo.findById(id);        
        //model.addAttribute("hotel", hotel);
        RoomTypeEntity roomType = new RoomTypeEntity();

        model.addAttribute("roomType", roomType);
        setHotelDropdowList(model);
        //setHotelName(id, model);

        return "addNew/addNewRoomTypePage";
    }
    //Dropdow Hotel
    private void setHotelDropdowList(Model model) {
        List<HotelEntity> hotelList = (List<HotelEntity>) hotelRepo.findAll();
        if (!hotelList.isEmpty()) {
            Map<Integer, String> hotelMap = new LinkedHashMap<>();
            for (HotelEntity hotel : hotelList) {
                hotelMap.put(hotel.getId(), hotel.getName());
            }
            model.addAttribute("hotelList", hotelMap);
        }
    }
    // save new Room Type
    @RequestMapping(value = "/addNewRoomType", method = RequestMethod.POST)
    public String saveNewRoomType(@RequestParam("file") MultipartFile file, RoomTypeEntity roomType, Model model) {

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

            String fileSource2 = dir2.getAbsolutePath() + File.separator
                    + file.getOriginalFilename();
            File serverFile2 = new File(fileSource2);
            BufferedOutputStream stream2
                    = new BufferedOutputStream(new FileOutputStream(serverFile2));
            stream2.write(bytes);
            stream2.close();

            String fileName = file.getOriginalFilename();
            //model.addAttribute("filename", fileName);

            roomType.setImages(fileName);
            model.addAttribute("roomType", roomType);
            roomTypeRepo.save(roomType);;
            return "redirect:/view-all-hotel/1";
        } catch (Exception e) {
            System.out.println(e);
            return "redirect:/view-all-hotel/1";
        }
    }

}
