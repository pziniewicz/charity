package pl.zini.charity.model;

import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Data
@EntityListeners(AuditingEntityListener.class)
@MappedSuperclass
public class BaseClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
}
