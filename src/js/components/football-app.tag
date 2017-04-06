<football-app>

    <span class="pulse"></span><span class="live">Live</span>

    <div class="image">
        <img class="background" src="http://www.tageswoche.ch/images/cms-image-004745288.jpg" alt="" />
    </div>

    <img class="logo_home" src="{ this.fcb.logo }" />
    <span class="score">{ this.livescoreData.home_score } : { this.livescoreData.away_score }</span>

    <img class="logo_away" src="{ this.yb.logo }" />

    <style>

        .score {
            position: absolute;
            color: white;
            top: 300px;
            left: 250px;
            font-size: 48px;
            font-family: sans-serif;
        }

        .logo_home {
            position: absolute;
            top: 225px;
        }



        .logo_away {
            position: absolute;
            top: 225px;
            left: 430px;
        }

        .image {
            position: relative;
            width:600px;
        }
        .image .background {
            width:100%;
            vertical-align:top;
        }
        .image:after {
            content:'\A';
            position:absolute;
            width:100%; height:100%;
            bottom:0;
            background:rgba(0,0,0,0.6);
            opacity:0.5;
        }

        .pulse {
            position: absolute;
            top: -85px;
            left: -85px;
            z-index: 10;
            margin:100px;
            display: block;
            width: 22px;
            height: 22px;
            border-radius: 50%;
            background: #008249;
            box-shadow: 0 0 0 rgba(0,130,73, 0.8);
            animation: pulse 1s infinite;
        }
        .pulse:hover {
            animation: none;
        }

        @-webkit-keyframes pulse {
            0% {
                -webkit-box-shadow: 0 0 0 0 rgba(0,130,73, 0.8);
            }
            70% {
                -webkit-box-shadow: 0 0 0 10px rgba(0,130,73, 0.4);
            }
            100% {
                -webkit-box-shadow: 0 0 0 0 rgba(0,130,73, 0);
            }
        }
        @keyframes pulse {
            0% {
                -moz-box-shadow: 0 0 0 0 rgba(0,130,73, 0.8);
                box-shadow: 0 0 0 0 rgba(0,130,73, 0.4);
            }
            70% {
                -moz-box-shadow: 0 0 0 10px rgba(0,130,73, 0.4);
                box-shadow: 0 0 0 10px rgba(0,130,73, 0);
            }
            100% {
                -moz-box-shadow: 0 0 0 0 rgba(0,130,73, 0);
                box-shadow: 0 0 0 0 rgba(0,130,73, 0);
            }
        }

        .live {
            position: absolute;
            top: 19px;
            left: 45px;
            z-index: 10;
            color: white;
            font-family: sans-serif;
        }

    </style>

    <script type="text/babel">

        import {Soccerama} from 'soccerama'

        this.livescoreData = ''

        const soccerama = new Soccerama('VGB7bDVCo9b4lW726imNa5pXbW6Sd8hbas3Ifr3MQlZV2cqOvAw9KGH0BWYg', 'v1.2')


        this.livescore = () => {
            soccerama.get('livescore/match/{id}', { id: 692626 }).then(data => {
                this.update({
                    livescoreData: data
                })
                console.log(this.livescoreData)
            })
        }

        //let refresh = setInterval(this.livescore, 100000)
        this.livescore()

        //get data for the teams, FCB

        this.fcb = ''

        soccerama.get('teams/{id}', { id: 118 }).then(data => {
            this.update({
                fcb: data
            })
            console.log(this.fcb)
        })

        //get data for the teams, Winti

        this.yb = ''

        soccerama.get('teams/{id}', { id: 169 }).then(data => {
            this.update({
                yb: data
            })
            console.log(this.yb)
        })

    </script>


</football-app>