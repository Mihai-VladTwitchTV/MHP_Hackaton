package project.springbootHackaton.data.baseClasses;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long bookingId;

    public Booking() {
    }

    public Booking(LocalDateTime startTime, LocalDateTime endTime, String purpose, User user, Desk desk) {
        //this.bookingId = bookingId;
        this.startTime = startTime;
        this.endTime = endTime;
//       this.status = status;
        this.purpose = purpose;
        this.user = user;
        this.desk = desk;
    }

    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private String status;
    private String purpose;



    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public User getUser(){
        return user;
    }

    @ManyToOne
    @JoinColumn(name = "desk_id")
    private Desk desk;

}