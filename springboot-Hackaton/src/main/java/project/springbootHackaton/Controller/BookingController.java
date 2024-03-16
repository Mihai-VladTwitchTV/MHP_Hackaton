package project.springbootHackaton.Controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import project.springbootHackaton.data.baseClasses.Booking;
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
    public ResponseEntity<String> bookDesk(@RequestParam Long deskId,
                                           @RequestParam LocalDateTime startTime,
                                           @RequestParam LocalDateTime endTime,
                                           @RequestParam String purpose,
                                           @RequestParam Long userId,
                                           @RequestParam Long deskID) {
        try {
            bookingService.bookDesk(deskId, startTime, endTime, purpose, userId, deskID);
            return ResponseEntity.ok("Desk booked successfully.");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/{deskId}")
    public ResponseEntity<List<Booking>> getBookingsForDesk(@PathVariable Long deskId) {
        List<Booking> bookings = bookingService.getBookingsForDesk(deskId);
        return ResponseEntity.ok(bookings);
    }
}

