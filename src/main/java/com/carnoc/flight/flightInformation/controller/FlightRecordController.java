package com.carnoc.flight.flightInformation.controller;

import com.alibaba.fastjson.JSON;
import com.carnoc.flight.flightInformation.pojo.AircompanytBasicData;
import com.carnoc.flight.flightInformation.pojo.AirportBasicData;
import com.carnoc.flight.flightInformation.pojo.FlightRecord;
import com.carnoc.flight.flightInformation.service.AircompanytBasicDataService;
import com.carnoc.flight.flightInformation.service.FlightRecordService;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.sun.deploy.net.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * 航班动态数据控制器
 * @Author: lpf
 * @Date 2018/10/26/026  20:21
 **/
@Controller
public class FlightRecordController {

    @Resource
    private FlightRecordService flightRecordService;
    @Resource
    private AircompanytBasicDataService aircompanytBasicDataService;


    /**
     * /获得航班动态信息
     * @param response
     * @param flightRecord
     * @throws IOException
     */
    @RequestMapping(value="/getFlightRecord.do")
    public void getFlightRecord(HttpServletResponse response, FlightRecord flightRecord) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        //获得航班动态信息
        List<FlightRecord> flightRecordList = flightRecordService.getFlightRecord(flightRecord);
        response.getWriter().write(JSON.toJSONString(flightRecordList));
    }


    /**
     * 获得航空公司基础数据
     * @param response
     */
    @RequestMapping("/getAirCompanyBasicData.do")
    public void getAirCompanyBasicData(HttpServletResponse response) throws IOException{
        response.setContentType("text/html;charset=utf-8");
        List<AircompanytBasicData> airportBasicDataList =aircompanytBasicDataService.getAircompanytBasicData();
        response.getWriter().write(JSON.toJSONString(airportBasicDataList));
    }


    /**
     * 按条件查询航班动态信息
     * @param response
     * @param flightRecord
     * @throws IOException
     */
    @RequestMapping(value="/getFlightRecordByCondition.do")
    public void getFlightRecordBy(HttpServletResponse response, FlightRecord flightRecord) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("查询条件："+flightRecord);
        List<FlightRecord> flightRecordList = flightRecordService.getFlightRecord(flightRecord);
        response.getWriter().write(JSON.toJSONString(flightRecordList));
    }


    /**
     * 根据id获得航班动态数据
     * @param id
     */
    @RequestMapping(value = "/getFlightRecordById.do")
    @ResponseBody
    public FlightRecord getFlightRecordById(int id, HttpServletResponse response){
        FlightRecord flightRecord= flightRecordService.getFlightRecordById(id);
        return flightRecord;
    }

    /**
     * 修改航班动态信息数据
     * @param flightRecord
     * @param response
     * @throws IOException
     */
    @RequestMapping(value ="/updateFlightRecord.do")
    public void updateFlightRecord(FlightRecord flightRecord,HttpServletResponse response) throws  IOException{
        String result = flightRecordService.updateFlightRecord(flightRecord)+"";
        response.getWriter().write(result);
    }



    @RequestMapping(value = "/getdelayRemark")
    @ResponseBody
    public Map getdelayRemark(Map map){
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
        String addTimes = dateformat.format(System.currentTimeMillis()-86400000);

        String startDate = addTimes+" 00:00:00";
        String endDate = addTimes+" 23:59:59";
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        Map map1 = flightRecordService.getdelayRemark(map);
        System.out.println(map1);
        return map1;
    }









}
