/* Convenience wrapper for asciinema-player. */
/* SPDX-License-Identifier: MIT OR CC-BY-SA-4.0 */
/* SPDX-FileCopyrightText: 2023 Rob Moss <robm.dev@gmail.com> */

/**
 * Create asciinema players for elements that have "id" and "data-cast-file"
 * attributes.
 *
 * For example:
 *
 *     <div id="my-video" data-cast-file="my-video.cast"></div>
 *
 * You can also define links that jump the player to a specific time.
 * For each link, set the "data-video" attribute to the video's "id" attribute
 * and set the "data-seek-to" attribute to the time (in seconds).
 *
 * For example:
 *
 *     <ol>
 *       <li><a data-video="my-video" data-seek-to="0" href="javascript:;">Start</a></li>
 *       <li><a data-video="my-video" data-seek-to="120" href="javascript:;">Two minutes</a></li>
 *     </ol>
 *
 */

(function() {
"use strict";

function addAsciinemaPlayer(cast_file, container_id) {
    const player = AsciinemaPlayer.create(
        cast_file,
        document.getElementById(container_id),
        { poster: 'npt:0:0.1', theme: 'gimlb-auto', fit: 'width' });

    // Find all elements that seek to specific times in this video.
    const selector = '[data-video="' + container_id + '"][data-seek-to]'
    const time_stamps = document.querySelectorAll(selector);

    // Add an event handler for each element that seeks to the specified time.
    time_stamps.forEach(elt => {
        // Ignore elements with invalid seek times.
        const seek_to = parseInt(elt.getAttribute('data-seek-to'));
        if (isNaN(seek_to) || seek_to < 0) {
            return
        }

        elt.addEventListener('click', () => {
            player.seek(elt.getAttribute('data-seek-to'));
        });

        // Add a time-stamp to the end of the link text.
        if (elt.tagName === 'A') {
            const minutes = Math.floor(seek_to / 60).toString();
            var seconds = (seek_to % 60).toString();
            if (seconds.length < 2) {
                seconds = '0' + seconds;
            }
            const time_stamp = ' (' + minutes + ':' + seconds + ')';
            elt.insertAdjacentHTML('beforeend', time_stamp);
        }
    });
}

function addPlayers() {
    // Final all video place-holders.
    const selector = '[id][data-cast-file]';
    const players = document.querySelectorAll(selector);

    // Create an asciinema player for each place-holder element.
    players.forEach(elt => {
        const cast_file = elt.getAttribute('data-cast-file');
        const container_id = elt.getAttribute('id');
        addAsciinemaPlayer(cast_file, container_id);
    })
}

// Create a player for each place-holder in the document.
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', addPlayers);
} else {
    addPlayers();
}

})();
