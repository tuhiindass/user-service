package com.tuhin.user_service;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.logging.Logger;

@RestController
@RequestMapping("/user")
public class DemoController {
    private static final Logger logger = Logger.getLogger(DemoController.class.getName());


    @GetMapping
    public ResponseEntity<String> getMessage() {
        return ResponseEntity.ok("Welcome to user service");
    }
}