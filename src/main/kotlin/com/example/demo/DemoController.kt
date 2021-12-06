package com.example.demo

import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class DemoController {

    @Value("\${spring.application.name}")
    var applicationName: String? = null

    @GetMapping("/")
    fun index(): String {
        return "Hello, World! - ${this.applicationName}"
    }

}
