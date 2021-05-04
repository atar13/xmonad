Config { font = "xft:MesloLGS NF:regular:pixelsize=15:antialias=true:hinting=true"
       , additionalFonts = []
       , borderColor = "black"
       , border = TopB
       , bgColor = "black"
       , fgColor = "gray"
       , alpha = 255
       , position = TopW L 90
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run Weather "KLAX" ["-t","<tempF>F",
                                          "-L","60","-H","80",
                                          "--normal","green",
                                          "--high","red",
                                          "--low","lightgreen"] 36000
                    , Run Network "eth0" ["-L","0","-H","32",
                                          "--normal","green","--high","red"] 10
                    , Run Network "eth1" ["-L","0","-H","32",
                                          "--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50",
                               "--normal","green","--high","red",
			       "-t", "cpu: <total>%"] 10
                    , Run Memory ["-t","ram: <usedratio>%", 
		    		  "-l", "green", "-n", "yellow", "-h", "red"] 10
                    , Run Swap [] 10
                    , Run Com "uname" ["-s","-r"] "" 36000
                    , Run Date "%a %_d %H:%M:%S" "date" 10
		    , Run Volume "default" "Master" [ "-t", "<status> <volumevbar> <volume>%" ] 10 
		    , Run Mpris2 "museeks" ["-t", "▶ <title>"] 10
		    , Run Com "uptime" ["--pretty"] "uptime1" 600
		    , Run Uptime ["-t", "up: <hours>"] 3600
		    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader%  }\
                    \{  %uptime% | %mpris2% | %KLAX% | %cpu% | %memory% | %default:Master% | <fc=#f4c0ff>%date%</fc>"
       }
