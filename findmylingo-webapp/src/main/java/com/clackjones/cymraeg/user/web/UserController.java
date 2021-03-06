package com.clackjones.cymraeg.user.web;

import com.clackjones.cymraeg.user.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserManager userManager;

    @RequestMapping(path = "/profile", method = RequestMethod.GET)
    public ModelAndView viewUserProfile(Principal principal) {
        // get user object
        if (principal.getName() == null) {
            // return permission denied
        }

        String username = principal.getName();
        User user = userManager.findUserByUsername(username);

        // display them
        ModelAndView view = new ModelAndView("proffil");
        view.addObject("gwasanaethau", user.getGwasanaethau());
        view.addObject("user", user);

        return view;
    }

}
