package ru.javawebinar.topjava.repository.datajpa;

import org.springframework.stereotype.Repository;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.model.User;
import ru.javawebinar.topjava.repository.MealRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class DataJpaMealRepository implements MealRepository {

    private final CrudMealRepository crudRepository;

    public DataJpaMealRepository(CrudMealRepository crudRepository) {
        this.crudRepository = crudRepository;
    }

    @Override
    public Meal save(Meal meal, int userId) {
        if (crudRepository.findByIdAndUserId(meal.id(), userId) == null) {
            User user = new User();
            meal.setUser(user);
            meal.getUser().setId(userId);
            return crudRepository.save(meal);
        }
        crudRepository.update(meal.getDescription(), meal.getCalories(), meal.getDateTime(), meal.id(), userId);
        return meal;
    }

    @Override
    public boolean delete(int id, int userId) {
        if (crudRepository.findById(id).get().getUser().getId() != userId) {
            return false;
        }
        return crudRepository.delete(id) != 0;
    }

    @Override
    public Meal get(int id, int userId) {
        return crudRepository.findByIdAndUserId(id, userId);
    }

    @Override
    public List<Meal> getAll(int userId) {
        return crudRepository.findByUserIdOrderByDateTimeDesc(userId);
    }

    @Override
    public List<Meal> getBetweenHalfOpen(LocalDateTime startDateTime, LocalDateTime endDateTime, int userId) {
        return crudRepository.getBetweenHalfOpen(startDateTime, endDateTime, userId);
    }
}
