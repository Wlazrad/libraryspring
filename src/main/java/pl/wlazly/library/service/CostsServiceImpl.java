package pl.wlazly.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.wlazly.library.entity.Borrow;
import pl.wlazly.library.entity.User;
import pl.wlazly.library.repository.BorrowRepository;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.stream.Collectors;

@Service("costsService")
@Transactional
public class CostsServiceImpl implements CostsService {



    @Autowired
    private BorrowServiceImpl borrowService;

    @Autowired
    private BorrowRepository borrowRepo;

    @Autowired
    private UserService userService;

    @Override
    public void saveCosts(User user) {
        BigDecimal totalSum = BigDecimal.valueOf(0);
        BigDecimal sum = BigDecimal.valueOf(0);
        BigDecimal daysAfter = BigDecimal.valueOf(0);
        BigDecimal costPerDay = BigDecimal.valueOf(0.50);
        List<Borrow> borrows = borrowService.getBorrowsByUser(user);
        List<LocalDate> dateList = borrows.stream().map(borrow -> borrow.getStartDate()).collect(Collectors.toList());
        List<Integer> days = dateList.stream().map(localDate -> Period.between(localDate, LocalDate.now()).getDays()).collect(Collectors.toList());
        for(int day : days){
            if(day>7) {
                sum=sum.add(BigDecimal.valueOf(2));
                daysAfter = BigDecimal.valueOf(day - 7);
                sum=sum.add(daysAfter.multiply(costPerDay));
                totalSum=totalSum.add(sum);
            }
        }
        userService.updateUserCosts(totalSum, user.getEmail());
    }

    @Override
    public void blockBorrowBooks(User user) {
        if(user.getCosts().doubleValue()>0) {
            user.setBan(true);
            userService.updateUserBan(true, user.getEmail());
        }else{
            user.setBan(false);
        }
    }

}
