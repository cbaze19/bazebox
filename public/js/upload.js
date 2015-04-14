$(function() {
    
	$('.glyphicon-cloud-upload').click(function() {
		$('#fileChooser').click();
	});

	$('#fileChooser').change(function() {
		$('#uploadForm').submit();
	});

});