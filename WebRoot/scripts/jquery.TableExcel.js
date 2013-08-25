/*
生成EXCEL的数据格式定义：
{
	name: '',
	widths: [xxx,…,xxx],
	clazz" '',
	style: '',
	data: [
		{
			height: xxx,
			clazz" '',
			style: '',
			cell: [
				{
					range: 'xxx.xxx',
					text: '',
					clazz: '',
					style: ''
},…{
…
}
]
		},…,{
		}
], …,[
…
]
}
*/
(function($) {
	$.fn.exportTableData = function(options) {
		var opts = $.extend({}, $.fn.exportTableData.defaults, options); 
		
		var table = $(this[0]);
		if (table.attr('nodeName').toUpperCase() != 'TABLE')
			return null;
		
		var result = {
			widths: [],
			data: []
		};

		readCSS(result, table);

		var cols = table.find('col');
		cols.each(function(i) {
			result.widths[i] = $(this).width();
		})
		
		var trs = table.find('tr');
		trs.each(function(row) {
			var tr = $(this);
			
			result.data[row] = {
				height: tr.height(),
				cell: []
			};

			readCSS(result.data[row], tr);

			var tds = tr.find('td');
			tds.each(function(col) {
				var td = $(this);
				
				var val = td.html();
				if (opts.callback)
					val = opts.callback(tr, td, row, col, val);
				
				result.data[row].cell[col] = {
					text: val
				}
				
				readRange(result.data[row].cell[col], td);
				readCSS(result.data[row].cell[col], td);
			})
		})
		
		return result;
		
		function readRange(data, el) {
			var rowSpan = el.attr('rowSpan');
			var colSpan = el.attr('colSpan');
			
			rowSpan = rowSpan ? parseInt(rowSpan) : 1;
			colSpan = colSpan ? parseInt(colSpan) : 1;
			
			if (rowSpan != 1 || colSpan != 1)
				data.range = rowSpan + '.' + colSpan;
		}
		
		function readCSS(data, el) {
			var clazz = el.attr('class');
			if (clazz)
				data.clazz = clazz;
			
			var style = el.attr('style');
			if (style)
				data.style = style;
		}
	};
	
	$.fn.exportTableData.defaults = { 
		callback: function(tr, td, row, col, val) {
			return val;
		}
	}; 
	
	$.fn.parseImportTableConfig = function(options) {
		var opts = $.extend({}, $.fn.parseImportTableConfig.defaults, options); 
		
		var table = $(this[0]);
		if (table.attr('nodeName').toUpperCase() != 'TABLE')
			return null;
		
		var result = '';

		var trs = table.find('tr');
		trs.each(function(row) {
			var tr = $(this);
			
			var tds = tr.find('td');
			tds.each(function(col) {
				var td = $(this);
				
				if (opts.callback) {
					if (opts.callback({
						tr: tr, 
						td: td,
						row: row,
						col: col
					}) == false)
						return;
				}
				
				result += row + '.' + col + ' ';
			})
		})
		
		return result;
	};
	
	$.fn.parseImportTableConfig.defaults = { 
		callback: function(params) {
			return true;
		}
	}; 
	
	$.fn.importTableData = function(data, options) {
		var opts = $.extend({}, $.fn.importTableData.defaults, options); 

		var table = $(this[0]);
		if (table.attr('nodeName').toUpperCase() != 'TABLE')
			return null;
		
		var importTds = [];
		
		var trs = table.find('tr');
		trs.each(function(row) {
			var tr = $(this);
			
			var tds = tr.find('td');
			tds.each(function(col) {
				var td = $(this);
				
				var key = row + '.' + col;
				if (typeof(data[key]) == 'undefined') 
					return;
				
				var params = {
					tr: tr, 
					td: td,
					row: row,
					col: col,
					val: data[key]
				};
					
				if (opts.callback) {
					if (opts.callback(params) == false)
						return;
				}
				
				var val = params.val;
				var orgVal = td.html();
				if (val != null && val != orgVal) {
					td.html(val);
					
					importTds[importTds.length] = td;
				}
			})
		})
		
		if (importTds.length > 0 && opts.finish)
			opts.finish(importTds);
	};
	
	$.fn.importTableData.defaults = { 
		callback: function(params) {
			return true;
		},
		finish: function(tds) {
		}
	}; 
})(jQuery);