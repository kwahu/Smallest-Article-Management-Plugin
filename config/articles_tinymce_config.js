tinyMCE.init({
  mode : "textareas",
  theme : "advanced",
  language : 'pl',
  theme_advanced_toolbar_location : "top",
  theme_advanced_toolbar_align : "left",
  theme_advanced_statusbar_location : "bottom",
  plugin_insertdate_dateFormat : "%Y-%m-%d",
  plugin_insertdate_timeFormat : "%H:%M:%S",
  theme_advanced_resize_horizontal : false,
  theme_advanced_resizing : true,
  file_browser_callback : "fileBrowserCallBack",
  entity_encoding : "raw",
  apply_source_formatting : true,
  invalid_elements : "script",
  spellchecker_languages : "+English=en,Polish=pl",
    paste_auto_cleanup_on_paste : true,
  paste_convert_headers_to_strong : false,
  paste_strip_class_attributes : "all",
  paste_remove_spans : false,
  paste_remove_styles : false,
  relative_urls : true,
  convert_urls : false,
  width: "600"
});

       

function fileBrowserCallBack(field_name, url, type, win) {
          
  var fileBrowserWindow = new Array();
		
  switch (type) {
    case "image":
      fileBrowserWindow["file"] = "/admin/article_images"; // + "&type=" + type;
      break;
    case "file":
      fileBrowserWindow["file"] = "/admin/article_files"; // + "&type=" + type;
      break;
  }
        
  var cmsURL = window.location.toString();    // script URL - use an absolute path!
  if (cmsURL.indexOf("?") < 0) {
    //add the type as the only query parameter
    cmsURL = cmsURL + "?type=" + type;
  }
  else {
    //add the type as an additional query parameter
    // (PHP session ID is now included if there is one at all)
    cmsURL = cmsURL + "&type=" + type;
  }

  tinyMCE.activeEditor.windowManager.open({
    file : fileBrowserWindow["file"] ,
    title : 'File Browser',
    width : 590,  // Your dimensions may differ - toy around with them!
    height : 600,
    resizable : "yes",
    inline : "yes",  // This parameter only has an effect if you use the inlinepopups plugin!
    close_previous : "no"
  }, {
    window : win,
    input : field_name
  });
  return false;
}