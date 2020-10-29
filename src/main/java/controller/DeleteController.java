package controller;

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
public class DeleteController {

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

    //------------------------------------- Delete Hotel ---------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/delete-hotel/{id}", method = RequestMethod.GET)
    public String deleteHotel(@PathVariable int id) {

        hotelRepo.delete(hotelRepo.findById(id));

        return "redirect:/view-all-hotel/1";
    }

    //------------------------------------- Delete Room Type ---------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/delete-room-type/{id}", method = RequestMethod.GET)
    public String deleteRoomType(@PathVariable int id, Model model) {

        roomTypeRepo.delete(roomTypeRepo.findById(id));

        //int getHotelId = roomTypeRepo.getHotelIdByRoomTypeId(id);

        //model.addAttribute("getHotelId", getHotelId);

        return "redirect:/view-all-hotel/1"; //+ getHotelId;
    }
}
