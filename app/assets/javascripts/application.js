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
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require select2

function submitAjax(city, service){
	var params = {
		city: city,
		service: service,
		format: 'js',
	}
	jQuery.ajax({
        url: '',
        data: jQuery.param(params)
    });
}


function autocomplete(path, id, selectedData, placeholderText, dropdownClass, defaultText){
    jQuery('.select2-drop.' + dropdownClass).remove();
    jQuery(id).select2({
      formatSearching: function () { return defaultText[0]; },
      formatNoMatches: function () { return defaultText[1]; },
      formatLoadMore: function (pageNumber) { return defaultText[2]; },
      placeholder: placeholderText,
      multiple: true,
      dropdownCssClass: dropdownClass,
      ajax: {
        url: path,
        data: function (term, page) {
          return {
              term: term, // search term
              page_limit: 10,
              page: page,
              selection: jQuery(id).select2("val")
          };
        },
        results: function (data, page) {
          var more = (data.length == 10);

          return {
            results: data,
            more: more
          };
        }
      }
    });

    jQuery(window).on('scroll', function(){
      jQuery(id).select2('positionDropdown');
    });

    if(typeof selectedData != 'undefined')
      jQuery(id).select2("data", selectedData[0]);
  }
