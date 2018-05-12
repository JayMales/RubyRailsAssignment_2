$(document).ready(function(){
// password validation js

$('#newUserHolder input[type=submit]').prop('disabled', true);
var Fpas = 0;
var Spas = 0;
	$('#newUserHolder input[type=password]').keyup(function() {
		var pswd = $('#user_password').val();
    var pswdLength = pswd.length
		// validation flags
    var lFlag = 0;
    var loFlag = 0;
    var cFlag = 0;
    var nFlag = 0;
    var spFlag = 0;

    //validate length
		if ( pswdLength > 9 ) {
      $('#length').removeClass('invalid').addClass('valid');
      lFlag = 1;

		} else {
      $('#length').removeClass('valid').addClass('invalid');
      lFlag = 0

		}
		//validate lowercase letter
		if ( pswd.match(/[A-z]/) ) {
			$('#letter').removeClass('invalid').addClass('valid');
      loFlag = 1;
		} else {
			$('#letter').removeClass('valid').addClass('invalid');
      loFlag = 0;
		}

		//validate capital letter
		if ( pswd.match(/[A-Z]/) ) {
			$('#capital').removeClass('invalid').addClass('valid');
      cFlag = 1;
		} else {
			$('#capital').removeClass('valid').addClass('invalid');
      cFlag = 0;
		}

		//validate number
		if ( pswd.match(/\d/) ) {
      nFlag = 1;
			$('#number').removeClass('invalid').addClass('valid');
		} else {
      nFlag = 0;
			$('#number').removeClass('valid').addClass('invalid');
		}

		//validate special chars
		if ( pswd.match(/[^a-zA-Z0-9\-\/]/) ) {
      spFlag = 1;
			$('#space').removeClass('invalid').addClass('valid');
		} else {
      spFlag = 0;
			$('#space').removeClass('valid').addClass('invalid');
		}
    if(nFlag == 1 && cFlag == 1 && loFlag == 1 && lFlag == 1 && spFlag == 1){
      Fpas = 1;
      console.log('passed');
    }else{
      Fpas = 0;
    }
	}).focus(function() {
		$('#pswd_info').show();
	}).blur(function() {
		$('#pswd_info').hide();
	});


  // username validation js
  	$('#newUserHolder input[type=text]').keyup(function() {
  		var usr = $('#user_username').val();
      var usrLength = usr.length
      var lenFlag = 0;
      var hiFlag = 0;
  		//validate the length
  		if(usrLength > 1 && usrLength < 16 ) {
        $('#u_length').removeClass('invalid').addClass('valid');
        lenFlag = 1;
  		} else {
  			$('#u_length').removeClass('valid').addClass('invalid');
        lenFlag = 0;
  		}

  		//validate no special chars except '-' and '_'
  		if ( usr.match(/^[a-zA-Z0-9-_]+$/) ) {
  			$('#u_space').removeClass('invalid').addClass('valid');
        hiFlag = 1;
  		} else {
        $('#u_space').removeClass('valid').addClass('invalid');
        hiFlag = 0;
  		}
      if(hiFlag == 1 && lenFlag == 1){
        Spas = 1;
      }else{
        Spas = 0;
      }
  	}).focus(function() {
  		$('#usr_info').show();
  	}).blur(function() {
  		$('#usr_info').hide();
  	});

    if(Spas == 1 && Fpas == 1){
      console.log('passed');
      $('#newUserHolder input[type=submit]').prop('disabled', true);
    }else{
      $('#newUserHolder input[type=submit]').prop('disabled', false);
    }
});
