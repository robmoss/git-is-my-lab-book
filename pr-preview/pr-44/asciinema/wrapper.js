function addAsciinemaPlayer(cast_file, container_id) {
    const player = AsciinemaPlayer.create(
        cast_file,
        document.getElementById(container_id),
        { poster: 'npt:0:1', theme: 'dracula' });

    // Find all elements that seek to specific times in this video.
    const selector = '[data-video="' + container_id + '"][data-seek-to]'
    const time_stamps = document.querySelectorAll(selector);

    // Add an event handler for each element that seeks to the specified time.
    time_stamps.forEach(elt => {
        elt.addEventListener('click', () => {
            player.seek(elt.getAttribute('data-seek-to'));
        });
    });
}
