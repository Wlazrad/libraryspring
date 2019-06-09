package pl.wlazly.library.service;

import pl.wlazly.library.entity.User;

import java.math.BigDecimal;

public interface CostsService {

    void saveCosts(User user);
    void blockBorrowBooks(User user);
}
