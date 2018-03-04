package io.github.binout.karate

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
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

    @PostMapping
    fun greet(@RequestBody person:Person) = "Hello there, ${person.firstName} ${person.lastName}"
}

data class Person(val firstName:String, val lastName: String)