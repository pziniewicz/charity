package pl.zini.charity.service;

import org.modelmapper.ModelMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.zini.charity.DTO.UserEditDTO;
import pl.zini.charity.DTO.UserNewPassDTO;
import pl.zini.charity.DTO.UserRegisterDTO;
import pl.zini.charity.model.User;
import pl.zini.charity.repository.UserRepository;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void save(UserRegisterDTO user) {
        User newUser = new User();
        newUser.setFirstName(user.getFirstName());
        newUser.setLastName(user.getLastName());
        newUser.setEmail(user.getEmail());
        if (user.getPassword() !=null) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        newUser.setEnabled(true);
        newUser.setRole("ROLE_USER");
        userRepository.save(newUser);
    }

    public void save(User user) {
        if (user.getPassword() !=null) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        user.setRole("ROLE_USER");
        userRepository.save(user);
    }

    public User getById(Long id) {
        return userRepository.getById(id);
    }

    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public void delete(User user) {
        userRepository.delete(user);
    }

    public UserEditDTO getUserToEditById(Long id) {
        Optional<User> user = userRepository.findById(id);
        UserEditDTO userEditDTO = new UserEditDTO();
        if (user.isPresent()) {
            ModelMapper mapper = new ModelMapper();
            userEditDTO = mapper.map(user.get(), UserEditDTO.class);
        }
        return userEditDTO;
    }

    public void updateUser(UserEditDTO editUser) {
        Optional<User> optionalUser = userRepository.findById(editUser.getId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setLastName(editUser.getLastName());
            user.setFirstName(editUser.getFirstName());
            user.setEmail(editUser.getEmail());
            userRepository.save(user);
        }
    }

    public void userNewPass(UserNewPassDTO editUser) {
        Optional<User> optionalUser = userRepository.findById(editUser.getId());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            user.setPassword(passwordEncoder.encode(editUser.getNewPassword()));
            userRepository.save(user);
        }
    }

    public UserNewPassDTO getUserToChangePassById(Long id) {
        Optional<User> user = userRepository.findById(id);
        UserNewPassDTO userNewPassDTO = new UserNewPassDTO();
        if (user.isPresent()) {
            ModelMapper mapper = new ModelMapper();
            userNewPassDTO = mapper.map(user.get(), UserNewPassDTO.class);
        }
        return userNewPassDTO;
    }

    public Boolean hasAuthority(Long id) {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByEmail(email);
        return user.getId().equals(id);
    }
}
