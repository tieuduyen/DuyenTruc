package controller;

import entity.BookingDetailsEntity;
import entity.BookingEntity;
import entity.CityEntity;
import entity.CommentEntity;
import entity.HotelEntity;
import entity.RateEntity;
import entity.RoomTypeEntity;
import entity.UsersEntity;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
import repository.SlideRepository;
import repository.RoomTypeRepository;
import repository.UsersRepository;

@Controller
public class AdminController {

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

    //----------------------------------- Login + Log out --------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAdminLoginPage(Model model) {
        return "login/loginPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(name = "email") String email,
            @RequestParam(name = "noopPassword") String noopPassword,
            HttpSession session) {

        UsersEntity users = usersRepo.findByEmail(email);

        if (users.getNoopPassword().equals(noopPassword) && users.getRole().equals("ROLE_ADMIN")) {
            session.setAttribute("users", users);
            return "redirect:/homepage";
        } else {
            return "login/loginPage";
        }
    }

    // Log out
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("users");
        return "redirect:/";
    }

    //-------------------------------------- Admin Page ----------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/homepage", method = RequestMethod.GET)
    public String showAdminPage(Model model) {

        //----------------------------Booking Details Price Formatted (VN) ---------------------------
        Locale localeVN = new Locale("vi", "VN");

        double incomesBookingDetailsOctobor = bookingDetailsRepo.getIncomesBookingDetailsOctobor();
        NumberFormat numberFormatter = NumberFormat.getCurrencyInstance(localeVN);
        String incomesBookingDetailsOctoborFormatted = numberFormatter.format(incomesBookingDetailsOctobor);

        double incomesBookingDetails = bookingDetailsRepo.getIncomesBookingDetails();
        NumberFormat numberFormatters = NumberFormat.getCurrencyInstance(localeVN);
        String incomesBookingDetailsFormatted = numberFormatters.format(incomesBookingDetails);

        int countCity = cityRepo.getCountCity();
        int countHotel = hotelRepo.getCountHotel();
        int countBooking = bookingRepo.getCountBooking();
        int countUsers = usersRepo.getCountUsers();
        List<BookingEntity> bookingInOctobor = bookingRepo.findBookingInOctober();
        List<BookingEntity> bookingInSeptember = bookingRepo.findBookingInSeptember();

        model.addAttribute("incomesBookingDetailsOctoborFormatted", incomesBookingDetailsOctoborFormatted);
        model.addAttribute("incomesBookingDetailsFormatted", incomesBookingDetailsFormatted);
        model.addAttribute("countHotel", countHotel);
        model.addAttribute("countCity", countCity);
        model.addAttribute("countBooking", countBooking);
        model.addAttribute("countUsers", countUsers);
        model.addAttribute("bookingInOctobor", bookingInOctobor);
        model.addAttribute("bookingInSeptember", bookingInSeptember);

        return "adminpage/adminHome";
    }

    //----------------------------------------- Booking ----------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/view-booking-list/{pageBookingId}", method = RequestMethod.GET)
    public String showBookingList(@PathVariable int pageBookingId, Model model) {

        int countBooking = bookingRepo.getCountBooking();
        
        int limitBooking = 5;
        if (pageBookingId == 1) {
        } else {
            pageBookingId = (pageBookingId - 1) * limitBooking + 1;
        }
        
        //List<BookingEntity> bookingPending = bookingRepo.getBookingPending();
        //List<BookingEntity> bookingPending = bookingRepo.findBookings(pageable);
        //List<BookingEntity> bookingProcessed = bookingRepo.getBookingProcessed();
        //List<BookingEntity> bookingCancelled = bookingRepo.getBookingCancelled();
        List<BookingEntity> bookingList = bookingRepo.getAllBooking((pageBookingId - 1), limitBooking);

       // model.addAttribute("bookingPending", bookingPending);
       // model.addAttribute("bookingProcessed", bookingProcessed);
       // model.addAttribute("bookingCancelled", bookingCancelled);
        model.addAttribute("bookingList", bookingList);
        model.addAttribute("countBooking", countBooking);

        return "booking/viewBookingListPage";
    }

    //processed booking
    @RequestMapping(value = "/processed-booking/{id}", method = RequestMethod.GET)
    public String cancelBooking(@PathVariable(value = "id") int id) {

        BookingEntity booking = bookingRepo.findById(id);
        booking.setStatus("Processed");
        bookingRepo.save(booking);

        return "redirect:/view-booking-list";
    }

    //------------------------------------ Booking Details -------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/view-booking-details/{id}", method = RequestMethod.GET)
    public String showBookingDetails(@PathVariable(name = "id") int id, Model model) {

        int countBookingDetails = bookingDetailsRepo.getCountBookingDetailsByBookingId(id);

        double totalBookingDetails = bookingDetailsRepo.getTotalBookingDetails(id);
        NumberFormat numberFormatter = NumberFormat.getNumberInstance();
        String totalBookingDetailsFormatted = numberFormatter.format(totalBookingDetails);

        BookingEntity booking = bookingRepo.findById(id);
        List<BookingDetailsEntity> bookingDetailsList = bookingDetailsRepo.findBookingDetailsByBookingId(id);

        model.addAttribute("countBookingDetails", countBookingDetails);
        model.addAttribute("totalBookingDetailsFormatted", totalBookingDetailsFormatted);
        model.addAttribute("booking", booking);
        model.addAttribute("bookingDetailsList", bookingDetailsList);

        return "booking/viewBookingDetailsPage";
    }

    //-------------------------------------- City List -----------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/view-city-list/{pageCityId}", method = RequestMethod.GET)
    public String showCityList(@PathVariable int pageCityId, Model model) {

        int countCity = cityRepo.getCountCity();
        int limitCity = 4;
        if (pageCityId == 1) {
        } else {
            pageCityId = (pageCityId - 1) * limitCity + 1;
        }
        List<CityEntity> cityList = cityRepo.getAllCity((pageCityId - 1), limitCity);

        model.addAttribute("cityList", cityList);
        model.addAttribute("countCity", countCity);

        return "city/viewCityListPage";
    }
    
    
    //-------------------------------------- Hotel List -----------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/view-all-hotel/{pageHotelId}", method = RequestMethod.GET)
    public String showAllHotel(@PathVariable int pageHotelId, Model model) {

        int countHotel = hotelRepo.getCountHotel();
        int limitHotel = 5;
        if (pageHotelId == 1) {
        } else {
            pageHotelId = (pageHotelId - 1) * limitHotel + 1;
        }
        List<HotelEntity> allHotel = hotelRepo.getAllHotel((pageHotelId - 1), limitHotel);

        model.addAttribute("allHotel", allHotel);
        model.addAttribute("countHotel", countHotel);

        return "hotel/allHotelPage";
    }
    

    //---------------------------------- List Hotel By City ------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/city-manager/{id}", method = RequestMethod.GET)
    public String showHotelByCity(@PathVariable(value = "id") int id, Model model) {
        List<HotelEntity> availableHotel = hotelRepo.findHotelByCityId(id);
        List<RateEntity> rateList = (List<RateEntity>) rateRepo.findAll();
        CityEntity city = cityRepo.findById(id);

        model.addAttribute("availableHotel", availableHotel);
        model.addAttribute("city", city);
        model.addAttribute("rateList", rateList);

        return "hotel/viewHotelListPage";
    }
    

    //---------------------------------- List RoomType By City ---------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/hotel-manager/{id}", method = RequestMethod.GET)
    public String showRoomTypeByHotel(@PathVariable(value = "id") int id, Model model) {
        List<RoomTypeEntity> roomTypeList = roomTypeRepo.findRoomTypeByHotelId(id);
        HotelEntity hotel = hotelRepo.findById(id);

        model.addAttribute("roomTypeList", roomTypeList);
        model.addAttribute("hotel", hotel);

        return "hotel/viewRoomTypeListPage";
    }

    //-------------------------------------- Users List ----------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/view-users-list/{pageUserId}", method = RequestMethod.GET)
    public String showUsersList(@PathVariable int pageUserId, Model model) {

        int countUsers = usersRepo.getCountUsers();
        int limitUser = 5;
        if (pageUserId == 1) {
        } else {
            pageUserId = (pageUserId - 1) * limitUser + 1;
        }
        List<UsersEntity> usersList = usersRepo.getAllUsers((pageUserId - 1), limitUser);

        model.addAttribute("usersList", usersList);
        model.addAttribute("countUsers", countUsers);

        return "users/viewUsersListPage";
    }

    @RequestMapping(value = "/test/{pageUserId}")
    public String edit(@PathVariable int pageUserId, Model model) {
        int limitUser = 5;
        if (pageUserId == 1) {
        } else {
            pageUserId = (pageUserId - 1) * limitUser + 1;
        }
        List<UsersEntity> usersList = usersRepo.getAllUsers((pageUserId - 1), limitUser);

        model.addAttribute("usersList", usersList);

        return "users/test";
    }

    //----------------------------------- Profile Of User --------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/view-profile-user/{id}", method = RequestMethod.GET)
    public String showProfileUsersPage(@PathVariable(value = "id") int id, Model model) {

        //int registerDates = usersRepo.getRegisterDate(id);
        int countBookingByUser = bookingRepo.getCountBookingByUser(id);
        int countCommentByUser = commentRepo.getCountCommentByUser(id);
        List<CommentEntity> commentList = commentRepo.findCommentByUserId(id);
        List<BookingEntity> bookingList = bookingRepo.findBookingByUserId(id);
        UsersEntity users = usersRepo.findById(id);

        //CreditCardEntity creditCard = creditCardRepo.findById(id);
        model.addAttribute("countBookingByUser", countBookingByUser);
        model.addAttribute("countCommentByUser", countCommentByUser);
        model.addAttribute("bookingList", bookingList);
        model.addAttribute("commentList", commentList);
        model.addAttribute("users", users);
       // model.addAttribute("registerDates", registerDates);

        return "users/viewProfileUserPage";
    }

    //------------------------------------ Comment List ----------------------------------------------
    //------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/view-comment-list", method = RequestMethod.GET)
    public String showCommentList(Model model) {

        int countComment = commentRepo.getCountComment();
        List<CommentEntity> commentList = (List<CommentEntity>) commentRepo.findAll();

        model.addAttribute("countComment", countComment);
        model.addAttribute("commentList", commentList);

        return "comment/viewCommentListPage";
    }
}
