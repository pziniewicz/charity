package pl.zini.charity.service;

import org.springframework.stereotype.Service;
import pl.zini.charity.model.Category;
import pl.zini.charity.repository.CategoryRepository;

import java.util.List;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> findAll() {
        return categoryRepository.findAll();
    }
}
