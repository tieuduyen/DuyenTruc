package controller;

import entity.CityEntity;
import entity.HotelEntity;
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

@Controller
public class HotelController {
   @Autowired
   CityRepository cityRepo;
    
   @Autowired
   HotelRepository hotelRepo;
   
   @Autowired
   RoomTypeRepository roomTypeRepo;
   
   //View News
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAllCity(Model model) {

       List<CityEntity> city = (List<CityEntity>) cityRepo.findAll();
        
        model.addAttribute("city", city);
        
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
