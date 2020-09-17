package controller;

import entity.CityEntity;
import entity.HotelEntity;
import entity.RateEntity;
import entity.RoomEntity;
import entity.SlideEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import repository.CityRepository;
import repository.HotelRepository;
import repository.RateRepository;
import repository.SlideRepository;
import repository.RoomRepository;

@Controller
public class HotelController {

    @Autowired
    CityRepository cityRepo;

    @Autowired
    HotelRepository hotelRepo;

    @Autowired
    RoomRepository roomRepo;
    
    @Autowired
    RateRepository rateRepo;
    
    @Autowired
    SlideRepository slideRepo;

    //View City
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAllCity1(Model model) {

        List<SlideEntity> slideList =  (List<SlideEntity>) slideRepo.findAll();
        List<CityEntity> cityList = (List<CityEntity>) cityRepo.getAllCity();

        model.addAttribute("slideList", slideList);
        model.addAttribute("cityList", cityList);

        return "home";
    }

    //1 city có nhieu hotel(1-n)
    @RequestMapping(value = "/city/{name}", method = RequestMethod.GET)
    public String showHotelByCity(@PathVariable(value = "name") String name, Model model) {
        List<HotelEntity> hotelList = (List<HotelEntity>) hotelRepo.findHotelByName(name);
        List<RateEntity> rateList = (List<RateEntity>) rateRepo.findAll();
        
        CityEntity city = cityRepo.findByName(name);
        
        model.addAttribute("hotelList", hotelList);
        model.addAttribute("city", city);
        model.addAttribute("rateList", rateList);
        return "view-hotel-by-city";
    }
    
    // List TypeRoom By Hotel
    @RequestMapping(value = "/hotel/{name}", method = RequestMethod.GET)
    public String showRoomByHotel(@PathVariable(value = "name") String name, Model model) {
        HotelEntity hotel = hotelRepo.findByName(name);
        List<RoomEntity> roomList = (List<RoomEntity>) roomRepo.findRoomByName(name);
        
        model.addAttribute("hotel", hotel);
        model.addAttribute("roomList", roomList);
        //model.addAttribute("hotelList", hotelList);
        return "view-room-by-hotel";
    }
    
    // List TypeRoomDetails By Hotel
     @RequestMapping(value = "/room/{name}", method = RequestMethod.GET)
    public String showRoomDetailsByHotel(@PathVariable(value = "name") String name, Model model) {

        RoomEntity room =  roomRepo.findRoomDetailsByName(name);
        

        model.addAttribute("room", room);
        //model.addAttribute("hotelList", hotelList);
        return "view-room-details";
    }
}
