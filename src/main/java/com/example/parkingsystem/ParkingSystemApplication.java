package com.example.parkingsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class ParkingSystemApplication {
	public static void main(String[] args) {
		SpringApplication.run(ParkingSystemApplication.class, args);
	}
}