// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
$(document).ready(function() {
  function listUsers() {
    $.ajax({
      url: '/users.json',
      type: 'get',
      dataType: 'json',
      success: function(data)
      {
        var players;
        $('#players_list').html('');
        for(user in data)
        {
          var player = data[user];
          $('#players_list').append('<div>'+player.name+'<a href="#" class="view_user" data-id="'+player.id+'">Ver</a>'
            +' <a href="#" class="delete_user" data-id="'+player.id+'">Eliminar</a> </div>');
        }
      }
    });
  }
  
  function displayUser(player)
  {
    $('#player_details').html('');
    $('#player_details').append('<div><h3>'+player.name+'</h3><p>Wins: '+player.wins_count+'</p><p>Loses: '+player.loses_count+'</p></div>');
  }
  
  $('#user_form').submit(function() {
    var form_data = $(this).serialize();
    $.ajax({
      url: '/users.json',
      type: 'post',
      data: form_data,
      dataType: 'json',
      success: function(data)
      {
        var player = data;
        displayUser(player);
        $('#user_form').each(function() {this.reset()});
        listUsers();
      }
    });
    return false;
  });
  
  $('body').on('click', 'a.view_user', function(e) {
    var user_id = $(this).data('id');
    $.ajax({
      url: '/users/'+user_id+'.json',
      type: 'get',
      dataType: 'json',
      success: function(data)
      {
        console.log(data);
        var player = data;
        displayUser(player);
      }
    });
  });
  
  $('body').on('click', 'a.delete_user', function(e) {
    var user_id = $(this).data('id');
    if(confirm("¿Estás seguro de eliminar este registro?"))
    $.ajax({
      url: '/users/'+user_id,
      type: 'delete',
      dataType: 'json',
      success: function(data)
      {
        console.log(data);
        var player = data;
        listUsers();
      }
    });
  });
  
  listUsers();
});