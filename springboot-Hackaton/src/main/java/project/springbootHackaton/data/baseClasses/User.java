package project.springbootHackaton.data.baseClasses;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
//import project.springbootHackaton.data.baseClasses.UserProfile;

@Getter
@Setter
@Entity
public class User {

    @Id
    @Getter
    @Setter
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userID;

    @Getter
    @Setter
    @Column(nullable = false, length = 255)
    private String name;

    @Getter
    @Setter
    @Column(nullable = false, unique = true, length = 255)
    private String email;

    @Getter
    @Setter
    @Column(nullable = false, length = 255)
    private String password;

    @Getter
    @Setter
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date registrationDate;


    @Getter
    @Setter
    @Temporal(TemporalType.DATE)
    private Date lastLogin;



    @Getter
    @Setter
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id") // This line defines the foreign key column.
    private Role role;



//    @Getter
//    @Setter
//    @OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "profile_id", referencedColumnName = "id")
//    private UserProfile profile;

}
