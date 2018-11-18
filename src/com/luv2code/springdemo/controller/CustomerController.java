package com.luv2code.springdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {

	@RequestMapping("/selectTeam")
	public String listCustomers(Model theModel) {
		
		return "matches";
	}
	
	@RequestMapping("/")
    public String adminLogin(Model theModel) {
		
		return "index";
	}
	@RequestMapping("/admin_login_forward")
	public String toss(Model theModel) {
		
		return "admin_login_forward";
	}
	
	@RequestMapping("/Playing_11")
	public String selectPlayaer(Model theModel) {
		
		return "Playing_11";
	}
	@RequestMapping("/scorecard")
	public String selectPlayaerDao(Model theModel) {
		
		return "scorecard";
	}

	@RequestMapping("/updateForm")
	public String updateForm(Model theModel) {
		
		return "updateForm";
	}
	@RequestMapping("/strike")
	public String strike_update(Model theModel) {
		
		return "strike";
	}
	@RequestMapping("/UpdateScoreboard")
	public String score_update(Model theModel) {
		
		return "UpdateScoreboard";
	}
	@RequestMapping("/SelectBowler")
	public String update_bowler(Model theModel) {
		
		return "selectBowler";
	}
	@RequestMapping("/ScoreBoard")
	public String ScoreBoard(Model theModel) {
		
		return "scoreboardViewerPage";
	}
	@RequestMapping("/truncate")
	public String Truncate(Model theModel) {
		
		return "truncate";
	}
	@RequestMapping("/newMatch")
	public String newMatch(Model theModel) {
		
		return "newMatch";
	}
	@RequestMapping("/viewScorecard")
	public String viewScorecard(Model theModel) {
		
		return "viewScorecard";
	}
	@RequestMapping("/FullScoreboard")
	public String FullScoreboard(Model theModel) {
		
		return "fullScoreBoard";
	}
}


