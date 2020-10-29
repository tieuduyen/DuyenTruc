package controller;

import entity.CityEntity;
import entity.HotelEntity;
import entity.UsersEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
public class SearchController {
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
    
    //------------------------------ Search User By username-email-name ------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/search-user", method = RequestMethod.GET)
    public String searchUsersProcess(@RequestParam(name = "searchUser") String searchUser,
            Model model) {
        searchUser = "%" + searchUser + "%";
        List<UsersEntity> usersList = usersRepo.findByUsernameLikeOrEmailLikeOrNameLike(searchUser, searchUser, searchUser);

        model.addAttribute("usersList", usersList);

        return "users/viewUsersListPage";
    }
    
    
    //--------------------------------- Search City By city name -------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/search-city", method = RequestMethod.GET)
    public String searchCityProcess(@RequestParam(name = "searchCity") String searchCity,
            Model model) {
        searchCity = "%" + searchCity + "%";
        List<CityEntity> cityList = cityRepo.findByNameLike(searchCity);

        model.addAttribute("cityList", cityList);

        return "city/viewCityListPage";
    }
    
    //--------------------------------- Search City By city name -------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/search-hotel", method = RequestMethod.GET)
    public String searchHotelProcess(@RequestParam(name = "searchHotel") String searchHotel,
            Model model) {
        searchHotel = "%" + searchHotel + "%";
        List<HotelEntity> allHotel = hotelRepo.findByNameLike(searchHotel);

        model.addAttribute("allHotel", allHotel);

        return "hotel/allHotelPage";
    }
}
