
(function($) {
	
	$.fn.displaytable = function()
	{
		var table = $(this[0]);
		var exportstr={
				
				data: []
		};
		
		if (table.attr('nodeName').toUpperCase() != 'TABLE')
			
			return null;
		else
			{
			   var trs = table.find('tr');
			   trs.each(
					   function(row)
					   {
						   tr = $(this);
						   tds = tr.find('td');
						   var mark="";
						   var rowsMark="";
						   var colsMark="";
						   tds.each(
							function(col)
							{    
								td = $(this);
								rowsMark = rowsMark+td.rowSpan+"%";
								colsMark = colsMark+td.colSpan+"%";

							    mark=mark+td.html()+"%";
							}
						   );
						   
							exportstr.data[row] =
							{
							   rowSpan: rowsMark,
								text: mark
								
							};
							
				
					   }
					 );
			   return exportstr;
			}
	};
	
	
	
	
	
})(jQuery);


