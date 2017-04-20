<sportradar-app>

    <p>Stadion: { this.livescoreData.sport_event_conditions.venue.name }</p>
    <p>Heimteam: { this.livescoreData.sport_event.competitors[0].name }</p>
    <p>Auswärtsteam: { this.livescoreData.sport_event.competitors[1].name }</p>

    <script type="text/babel">

        this.livescoreData = ''

        const xhr = new XMLHttpRequest()
        const url = "https://api.sportradar.us/soccer-t3/other/de/matches/sr:match:9612103/timeline.json?api_key=we7ep6rpxy82gk9z2ux3xaex"

        this.livescore = () => {

            xhr.onreadystatechange = () => {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var matches = JSON.parse(xhr.responseText);
                    this.update({
                        livescoreData: matches
                    })
                    console.log(this.livescoreData)
                }
            }

            xhr.open("GET", url, true)
            xhr.send()
        }

        this.livescore()


    </script>




</sportradar-app>