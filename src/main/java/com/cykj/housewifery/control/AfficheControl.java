package com.cykj.housewifery.control;

import com.cykj.housewifery.bean.ReportDataBean;
import com.cykj.housewifery.service.AfficheService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/affiche")
public class AfficheControl {

    @Autowired
    private AfficheService afficheService;

    @RequestMapping(value = "/barAffiche",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object barAffiche(String time){
        Gson gson=new Gson();
        List<String> dates = gson.fromJson(time, new TypeToken<List<String>>(){}.getType());
        ReportDataBean dataBeans=afficheService.barAffiche(dates);
        System.out.println(new Gson().toJson(dataBeans));
        return new Gson().toJson(dataBeans);
    }

    @RequestMapping(value = "/lineAffiche",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object lineAffiche(String time){
        Gson gson=new Gson();
        List<String> dates = gson.fromJson(time, new TypeToken<List<String>>(){}.getType());
        ReportDataBean dataBeans=afficheService.lineAffiche(dates);
        System.out.println(new Gson().toJson(dataBeans));
        return new Gson().toJson(dataBeans);
    }

}
