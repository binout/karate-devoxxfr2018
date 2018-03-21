package io.github.binout.karate

import io.github.binout.karate.MovieEndpoint.Movie
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder
import org.springframework.web.util.UriBuilder
import java.util.*

@SpringBootApplication
class KarateApplication

fun main(args: Array<String>) {
    runApplication<KarateApplication>(*args)
}

var movies: MutableMap<String, Movie> = mutableMapOf()

@RestController
class Server {
    @GetMapping
    fun ping() = "pong"

    @PostMapping
    fun greet(@RequestBody person: Person) = "Hello there, ${person.firstName} ${person.lastName}"

    data class Person(val firstName: String, val lastName: String)
}

@RestController
@RequestMapping("/movies")
class MovieEndpoint {

    @PostMapping
    fun createMovie(@RequestBody movie: Movie): ResponseEntity<Movie> {
        val id = UUID.randomUUID().toString()
        val persistedMovie = movie.copy(id = id)
        movies.put(id, persistedMovie)
        return ResponseEntity.created(MvcUriComponentsBuilder
                .fromMethodName(MovieEndpoint::class.java, "getMovie", id)
                .build()
                .toUri()
        ).body(persistedMovie)
    }

    @GetMapping
    fun allMovies() = movies.values

    @GetMapping("/{id}")
    fun getMovie(@PathVariable("id") id: String): ResponseEntity<Movie> =
            movies[id]?.let { ResponseEntity.ok(it) }
            ?: ResponseEntity.notFound().build()

    @PostMapping("/{id}/actors")
    fun addActor(@PathVariable("id") id: String, @RequestBody actor: Actor): ResponseEntity<Unit> =
            movies[id]?.let {
                movies.put(it.id, it.copy(actors = it.actors + actor))
                return ResponseEntity.ok().build()
            } ?: ResponseEntity.notFound().build()

    data class Movie(val id: String = "", val title: String, val actors: Array<Actor> = emptyArray())
    data class Actor(val firstName: String, val lastName: String)
}

@RestController
@RequestMapping("/actors")
class ActorEndpoint {
    @GetMapping
    fun allActors() = movies.values.flatMap { it.actors.asIterable() }.distinct()
}

