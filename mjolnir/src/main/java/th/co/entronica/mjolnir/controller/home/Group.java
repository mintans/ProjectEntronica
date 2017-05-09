/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.home;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Mintans
 */
@Controller
@RequestMapping("/group")
public class Group {
    
    @Autowired
    private UserInfo userInfo;
    
    @Autowired
    private ProfileManager profileManager;
    
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getGroup(ModelMap model){
        model.addAttribute("userInfo", userInfo);
        model.put("formStructure", "structure");
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        return "structure/group";
    
    }
}
