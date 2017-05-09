/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package th.co.entronica.mjolnir.controller.home;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import th.co.entronica.mjolnir.model.db.Departments;
import th.co.entronica.mjolnir.model.db.Profile;
import th.co.entronica.mjolnir.model.db.Transfer;
import th.co.entronica.mjolnir.model.db.User;
import th.co.entronica.mjolnir.model.manage.DepartmentManager;
import th.co.entronica.mjolnir.model.manage.ProfileManager;
import th.co.entronica.mjolnir.model.manage.TransferManager;
import th.co.entronica.mjolnir.model.manage.UserManager;
import th.co.entronica.mjolnir.session.UserInfo;

/**
 *
 * @author Mintans
 */
@Controller
@RequestMapping("/structure")
public class Structure {
    
    @Autowired
    private UserInfo userInfo;
    
    @Autowired
    private UserManager userManager;

    @Autowired
    private DepartmentManager departmentManager;

    @Autowired
    private ProfileManager profileManager;
    
    @Autowired
    private TransferManager transferManager;
    
    
    @RequestMapping(value = "overview/{profileID}", method = RequestMethod.GET)
    public String getStructure(ModelMap model , HttpServletResponse response, @PathVariable String profileID){
        List<Departments> departmentsList = departmentManager.getAll();
        model.put("departmentsList", departmentsList);
        
        List<Departments> departmentsIDList = departmentManager.getAll();
        for (Departments departList1 : departmentsIDList) {
            model.put("departmentsIDList", departList1.getId());
        }
        List<User> userList = userManager.getAll();
        model.addAttribute("userInfo", userInfo);
        model.put("formStructure", "structure");
        model.put("userList", userList);
        List<Profile> profileList = profileManager.getAll();
        model.put("profileList", profileList);
        List<Transfer> transferList = transferManager.getAll();
        model.put("transferList", transferList);
        model.put("profileid", profileID);

        return "structure/structure";
    }
    
    @RequestMapping(value = "testteam", method = RequestMethod.GET)
    public String gettestteam(ModelMap model){

        return "test/testteam";
}
    }
