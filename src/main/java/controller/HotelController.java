package controller;

import entity.CityEntity;
import entity.HotelEntity;
import entity.RoomTypeEntity;
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
import repository.RoomTypeRepository;
import repository.SlideRepository;

@Controller
public class HotelController {

    @Autowired
    CityRepository cityRepo;

    @Autowired
    HotelRepository hotelRepo;

    @Autowired
    RoomTypeRepository roomTypeRepo;

    @Autowired
    SlideRepository slideRepo;

    //View City
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAllCity(Model model) {
        List<RoomTypeEntity> roomType = (List<RoomTypeEntity>) roomTypeRepo.getAllRoomType();
        List<CityEntity> bestCity = (List<CityEntity>) cityRepo.getCityImages();
        List<CityEntity> city = (List<CityEntity>) cityRepo.findAll();
        List<SlideEntity> slide = (List<SlideEntity>) slideRepo.findAll();

        model.addAttribute("roomType", roomType);
        model.addAttribute("bestCity", bestCity);
        model.addAttribute("city", city);
        model.addAttribute("slide", slide);

        return "home";
    }

    //1 city có nhieu hotel(1-n)
    @RequestMapping(value = "/view/{name}", method = RequestMethod.GET)
    public String showHotelByCity(@PathVariable(value = "name") String name, Model model) {
        List<HotelEntity> hotelList = (List<HotelEntity>) hotelRepo.findHotelByName(name);
        model.addAttribute("hotelList", hotelList);
        return "hotel-details";
    }
}
