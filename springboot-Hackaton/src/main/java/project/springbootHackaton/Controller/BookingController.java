package project.springbootHackaton.Controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import project.springbootHackaton.data.baseClasses.Booking;
import project.springbootHackaton.data.baseClasses.User;
import project.springbootHackaton.service.BookingService;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/bookings")
@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.POST})
public class BookingController {

    private final BookingService bookingService;

    @Autowired
    public BookingController(BookingService bookingService) {
        this.bookingService = bookingService;
    }

    @PostMapping
    public ResponseEntity<Booking> createBooking(@RequestBody Booking booking) {
        Booking createdUser = bookingService.createBooking(booking.
                getBookingId(),
                booking.getStartTime(),
                booking.getEndTime(),
                booking.getPurpose(),
                booking.getUser().
                getUserID(),
                booking.getDesk().getId() );
        return ResponseEntity.ok(createdUser);
    }

    @GetMapping("/{deskId}")
    public ResponseEntity<List<Booking>> getBookingsForDesk(@PathVariable Long deskId) {
        List<Booking> bookings = bookingService.getBookingsForDesk(deskId);
        return ResponseEntity.ok(bookings);
    }

    @GetMapping()
    public ResponseEntity<List<Booking>> getBookings() {
        List<Booking> bookings = bookingService.getAll();
        return ResponseEntity.ok(bookings);
    }


}

