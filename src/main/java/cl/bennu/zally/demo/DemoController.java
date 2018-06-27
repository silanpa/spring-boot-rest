package cl.bennu.zally.demo;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @CrossOrigin
    @GetMapping("/zally")
    public String zally() {
        return "Hello World";
    }
}
