package io.github.binout.karate

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@SpringBootApplication
class KarateApplication

fun main(args: Array<String>) {
    runApplication<KarateApplication>(*args)
}

@RestController
class Api {
    @GetMapping
    fun ping() = "pong"
}