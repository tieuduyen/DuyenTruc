package controller;

import entity.BookingEntity;
import entity.CityEntity;
import entity.HotelEntity;
import entity.UsersEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
public class SortController {
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
    
    
    //--------------------------------------------Sort User name ----------------------------------------
    //---------------------------------------------------------------------------------------------------
    // username Z-A
    @RequestMapping(value = "/sort-by-username-desc", method = RequestMethod.GET)
    public String sortUserFrom_Z_To_A(Model model) {
        
        List<UsersEntity> usersList = usersRepo.sortUsersDESC();
        
        model.addAttribute("usersList", usersList);
        
        return "users/viewUsersListPage";
    }
    // username A-Z
    @RequestMapping(value = "/sort-by-username-asc", method = RequestMethod.GET)
    public String sortUserFrom_A_To_Z(Model model) {
        List<UsersEntity> usersList = usersRepo.sortUsersASC();
        
        model.addAttribute("usersList", usersList);
        return "users/viewUsersListPage";
    }
    
    
    //--------------------------------------------Sort City Name ----------------------------------------
    //---------------------------------------------------------------------------------------------------
    // city name Z-A
    @RequestMapping(value = "/sort-by-city-name-desc/{pageCityId}", method = RequestMethod.GET)
    public String sortCityFrom_Z_To_A(@PathVariable int pageCityId, Model model) {
        
        int limitCity= 4;
        if (pageCityId == 1) {
        } else {
            pageCityId = (pageCityId - 1) * limitCity + 1;
        }
        
        List<CityEntity> cityDescList= cityRepo.sortCityDESC((pageCityId - 1), limitCity);
        
        model.addAttribute("cityDescList", cityDescList);
        
        return "city/sortCityDESC";
    }
    // city name Z-A
    @RequestMapping(value = "/sort-by-city-name-asc/{pageCityId}", method = RequestMethod.GET)
    public String sortCityFrom_A_To_Z(@PathVariable int pageCityId, Model model) {
        
        int limitCity= 4;
        if (pageCityId == 1) {
        } else {
            pageCityId = (pageCityId - 1) * limitCity + 1;
        }
        
        List<CityEntity> cityAscList= cityRepo.sortCityASC((pageCityId - 1), limitCity);
        
        model.addAttribute("cityAscList", cityAscList);
        
        return "city/sortCityASC";
    }

    
    //--------------------------------------------Sort Hotel Name ----------------------------------------
    //---------------------------------------------------------------------------------------------------
    // city name Z-A
    @RequestMapping(value = "/sort-by-hotel-name-desc/{pageHotelId}", method = RequestMethod.GET)
    public String sortHotelFrom_Z_To_A(@PathVariable int pageHotelId, Model model) {
        
        int countHotel = hotelRepo.getCountHotel();
        
        int limitHotel= 5;
        if (pageHotelId == 1) {
        } else {
            pageHotelId = (pageHotelId - 1) * limitHotel + 1;
        }
        
        List<HotelEntity> hotelDescList= hotelRepo.sortHotelDESC((pageHotelId - 1), limitHotel);
        
        model.addAttribute("countHotel", countHotel);
        model.addAttribute("hotelDescList", hotelDescList);
        
        return "hotel/sortHotelDESC";
    }
    // city name Z-A
    @RequestMapping(value = "/sort-by-hotel-name-asc/{pageHotelId}", method = RequestMethod.GET)
    public String sortHotelFrom_A_To_Z(@PathVariable int pageHotelId, Model model) {
        
        int countHotel = hotelRepo.getCountHotel();
        
        int limitHotel= 5;
        if (pageHotelId == 1) {
        } else {
            pageHotelId = (pageHotelId - 1) * limitHotel + 1;
        }
        
        List<HotelEntity> hotelAscList= hotelRepo.sortHotelASC((pageHotelId - 1), limitHotel);
        
        model.addAttribute("countHotel", countHotel);
        model.addAttribute("hotelAscList", hotelAscList);
        
        return "hotel/sortHotelASC";
    }
    
    
    //-------------------------------------------Sort Booking ----------------------------------------------
    //-------------------------------------------------------------------------------------------------------
    //Booking Pending
    @RequestMapping(value = "/booking-pending/{pageBookingPendingId}", method = RequestMethod.GET)
    public String getBookingPending(@PathVariable int pageBookingPendingId,Model model) {
        
        int countBookingPending = bookingRepo.getCountBookingPending();
        
        int limitBookingPending = 4;
        if (pageBookingPendingId == 1) {
        } else {
            pageBookingPendingId = (pageBookingPendingId - 1) * limitBookingPending + 1;
        }
        
        List<BookingEntity> bookingPending = bookingRepo.getAllBookingPending((pageBookingPendingId - 1), limitBookingPending);
        
        model.addAttribute("bookingPending", bookingPending);
        model.addAttribute("countBookingPending", countBookingPending);
        
        return "booking/viewBookingPendingPage";
    }
    
    //Booking Processed
    @RequestMapping(value = "/booking-processed/{pageBookingProcessedId}", method = RequestMethod.GET)
    public String getBookingProcessed(@PathVariable int pageBookingProcessedId,Model model) {
        
        int countBookingProcessed = bookingRepo.getCountBookingProcessed();
        
        int limitBookingProcessed = 4;
        if (pageBookingProcessedId == 1) {
        } else {
            pageBookingProcessedId = (pageBookingProcessedId - 1) * limitBookingProcessed + 1;
        }
        
        List<BookingEntity> bookingProcessed = bookingRepo.getAllBookingProcessed((pageBookingProcessedId - 1), limitBookingProcessed);
        
        model.addAttribute("bookingProcessed", bookingProcessed);
        model.addAttribute("countBookingProcessed", countBookingProcessed);
        
        return "booking/viewBookingProcessedPage";
    }
    //Booking Pending
    @RequestMapping(value = "/booking-cancelled/{pageBookingCancelledId}", method = RequestMethod.GET)
    public String getBookingCancelled(@PathVariable int pageBookingCancelledId,Model model) {
        
        int countBookingCancelled = bookingRepo.getCountBookingCancelled();
        
        int limitBookingCancelled = 4;
        if (pageBookingCancelledId == 1) {
        } else {
            pageBookingCancelledId = (pageBookingCancelledId - 1) * pageBookingCancelledId + 1;
        }
        
        List<BookingEntity> bookingCancelled = bookingRepo.getAllBookingCancelled((pageBookingCancelledId - 1), limitBookingCancelled);
        
        model.addAttribute("bookingCancelled", bookingCancelled);
        model.addAttribute("countBookingCancelled", countBookingCancelled);
        
        return "booking/viewBookingCancelledPage";
    }
       
}
