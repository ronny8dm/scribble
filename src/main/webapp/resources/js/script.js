$(document).ready(function() {
    // Listen for the form submission event
    $('#form').submit(function(event) {
        // Prevent the form from submitting normally
        event.preventDefault();

        fire_ajax_submit();

    });

    // Add click event listeners to the dropdown toggle buttons
    $('.dropdown-toggle').click(function() {
        $(this).parent().toggleClass('show');
        $(this).next('.dropdown-menu').toggleClass('show');
    });
});

function fire_ajax_submit() {
    // Get the search query from the input field
    var query = $('#keyword').val();

    $('#btn-search').prop("disabled", true);

    // Send an AJAX request to the server to search for the query
    $.ajax({
        url: 'items/search',
        type: 'GET',
        data: {
            q: query
        },
        success: function(data) {
            // Display the search results on the page
            $('#items').html(data);
            $('#btn-search').prop("disabled", false);
        },
        error: function() {
            alert('An error occurred while searching.');
            $('#btn-search').prop("disabled", false);
        }

    });
}