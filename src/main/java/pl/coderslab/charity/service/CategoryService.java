package pl.coderslab.charity.service;

import pl.coderslab.charity.repository.CategoryRepository;

public class CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
}
