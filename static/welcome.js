async function getData() {
    try {
      const response = await fetch('/movies')
      let text = await response.text();
      generateMovies(text)
    } catch (err) {
      console.error(err);
    }
  }
getData()

function onYouTubeIframeAPIReady() {
        
    let player;
    player = new YT.Player('youtube-video', {
    videoId: 'LTgRm6Qgscc',
    events: {
      'onReady': onPlayerReady
    },
    playerVars: {
    autoplay: 1,
    mute: 1,
  },
});
}
function onPlayerReady(event) {
event.target.playVideo();
}
