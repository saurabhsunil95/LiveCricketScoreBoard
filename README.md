# LiveCricketScoreBoard


## Database part
CREATE TABLE `batting_team1` (
  `player` varchar(30) DEFAULT NULL,
  `runs` int(11) DEFAULT NULL,
  `balls` int(11) DEFAULT NULL,
  `flag_status` int(11) DEFAULT NULL,
  `strike_rate` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `bowling_team2` (
  `player` varchar(30) DEFAULT NULL,
  `overs` float(2,1) DEFAULT NULL,
  `runs` int(11) DEFAULT NULL,
  `wicket` int(11) DEFAULT NULL,
  `flag_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `ce` (
  `player_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cse` (
  `player_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

same for other branch or team

CREATE TABLE `first_to_bat` (
  `team_name` varchar(10) DEFAULT NULL,
  `flag_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `login` (
  `user` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `score_display` (
  `totalruns` int(11) DEFAULT NULL,
  `wicket` int(11) DEFAULT NULL,
  `overs` float(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `score_display_status` (
  `matches_name` varchar(50) DEFAULT NULL,
  `totalruns` int(11) DEFAULT NULL,
  `wicket` int(11) DEFAULT NULL,
  `overs` float(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

**Below table dynamically created:: **

CREATE TABLE `'csevsecebattingcse'` (
  `player` varchar(30) DEFAULT NULL,
  `runs` int(11) DEFAULT NULL,
  `balls` int(11) DEFAULT NULL,
  `flag_status` int(11) DEFAULT NULL,
  `strike_rate` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
