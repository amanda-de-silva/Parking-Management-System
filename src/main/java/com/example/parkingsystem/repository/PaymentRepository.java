package com.example.parkingsystem.repository;

import com.example.parkingsystem.model.Payment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

@Repository
public class PaymentRepository {

    private final JdbcTemplate jdbcTemplate;

    public PaymentRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private Payment mapRow(ResultSet rs, int rowNum) throws SQLException {
        Payment p = new Payment();
        p.setId(rs.getLong("id"));
        p.setCustomerName(rs.getString("customer_name"));
        p.setAmount(rs.getDouble("amount"));
        p.setPaymentMethod(rs.getString("payment_method"));
        p.setTransactionId(rs.getString("transaction_id"));
        p.setDate(rs.getTimestamp("date").toLocalDateTime());
        p.setReservationId(rs.getLong("reservation_id"));
        p.setStatus(rs.getString("status"));
        return p;
    }

    public Payment save(Payment payment) {
        String sql = "INSERT INTO payments (customer_name, amount, payment_method, transaction_id, date, reservation_id, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, payment.getCustomerName());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getPaymentMethod());
            ps.setString(4, payment.getTransactionId());
            ps.setObject(5, payment.getDate());
            ps.setLong(6, payment.getReservationId());
            ps.setString(7, payment.getStatus());
            return ps;
        }, keyHolder);

        payment.setId(keyHolder.getKey().longValue());
        return payment;
    }

    public List<Payment> findAll() {
        return jdbcTemplate.query("SELECT * FROM payments ORDER BY date DESC", this::mapRow);
    }

    public Payment findById(Long id) {
        String sql = "SELECT * FROM payments WHERE id = ?";
        List<Payment> payments = jdbcTemplate.query(sql, this::mapRow, id);
        return payments.isEmpty() ? null : payments.get(0);
    }

    public List<Payment> findByReservationId(Long reservationId) {
        String sql = "SELECT * FROM payments WHERE reservation_id = ? ORDER BY date DESC";
        return jdbcTemplate.query(sql, this::mapRow, reservationId);
    }
}