package pl.zini.charity.service;

import org.springframework.stereotype.Service;
import pl.zini.charity.model.Institution;
import pl.zini.charity.repository.InstitutionRepository;

import java.util.List;

@Service
public class InstitutionService {

    private final InstitutionRepository institutionRepository;

    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public List<Institution> findAll() {
        return institutionRepository.findAll();
    }

    public Institution getById(Long id) {
        return institutionRepository.getById(id);
    }

    public void delete(Institution institution) {
        institutionRepository.delete(institution);
    }

    public void save(Institution institution) {
        institutionRepository.save(institution);
    }

}
