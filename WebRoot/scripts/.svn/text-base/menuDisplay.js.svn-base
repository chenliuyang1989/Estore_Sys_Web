function create(obj)
{
    var datas = obj;
  
    
    var row = 0;
    var col = 0;
    var col1s = [];
   
    var count = datas.length;
   
    var pos = new Array(count); 
    var fistRow = [];
    var rowName = [];
    var rowNam = [];
    //debugger;

    for(i = 0; i < count ; i++)
    {
        var data = datas[i];
        pos[i] = new Object();
        pos[i].row = -1;
        pos[i].col = -1;
       
        pos[i].value = data[4];
        for(j = 0 ; j < rowName.length; j ++)
        {
            if(rowName[j] == data[0] && rowNam[j] == data[6])
            {
                pos[i].row = j;
                break;
            }
        }
        
             if(pos[i].row == -1)
        {
            pos[i].row = rowName.length;
            rowName.push(data[0]);
            rowNam.push(data[6]);
        }
        
        
        
        
        
        var row1 = '';
        var row2=  '';
        for(j = 0 ; j < fistRow.length; j ++)
       {
            if(fistRow[j].name == data[5])
            {
                row1 = fistRow[j];
                break;
            }
        }
        

         if(row1 == '')
        {
            row1 = new Object();
            row1.name = data[5];
            row1.secondRow = [];
           
            row1.row = 0;
            fistRow.push(row1);
        }
        
           for(j = 0 ; j < row1.secondRow.length; j ++)
         {
        	   
            if(row1.secondRow[j].name == data[0] && row1.secondRow[j].id == data[6])
            {
                row2 = row1.secondRow[j];
                break;
            }
         }
        
            if(row2 == '')
        {
            row2 = new Object();
            row2.name = data[0];
            
            row2.id = data[6];
     
            row2.row = 0;
            row1.secondRow.push(row2);
        }
        
        var col1 = '';
        var col2 = '';
        var col3 = '';
       
        for(j = 0 ; j < col1s.length; j ++)
       {
            if(col1s[j].name == data[1])
            {
                col1 = col1s[j];
                break;
            }
        }
       
        if(col1 == '')
        {
            col1 = new Object();
            col1.name = data[1];
            col1.col2s = [];
           
            col1.col = 0;
            col1s.push(col1);
        }
       
       
       
        for(j = 0 ; j < col1.col2s.length; j ++)
        {
            if(col1.col2s[j].name == data[2])
            {
                col2 = col1.col2s[j];
                break;
            }
        }
       
        if(col2 == '')
        {
            col2 = new Object();
            col2.name = data[2];
            col2.col3s = [];
           
            col1.col2s.push(col2);
        }
       
       
        for(j = 0 ; j < col2.col3s.length; j ++)
        {
            if(col2.col3s[j].name == data[3])
            {
                col3 = col2.col3s[j];
                col3.index.push(i);
                break;
            }
        }
       
        if(col3 == '')
        {
            col3 = new Object();
            col3.name = data[3];
            col3.index = []; 
            col3.index.push(i);
           
            col2.col3s.push(col3);
           
            col ++;
            col1.col ++;
        }   
       
    }
    
    var tr = '';
    var tr2 = '<tr><td>' + ' &nbsp;' + '</td>' + '<td>'+' &nbsp;' +'</td>';
    var tr3 = '<tr><td>' + ' &nbsp;' + '</td>' + '<td>'+' &nbsp;' +'</td>';
   
    var ind = 0;
   
   
        for(i = 0 ; i < col1s[0].col2s.length; i ++)
       {
            tr2 += '<td align="center" colspan="' + col1s[0].col2s[i].col3s.length + '">' + 

                col1s[0].col2s[i].name + '</td>' ;
            for(k = 0 ; k < col1s[0].col2s[i].col3s.length; k ++)
            {
                var node = col1s[0].col2s[i].col3s[k];
                tr3 += '<td align="center">' + node.name + '</td>' ;
               
                var indexs = node.index;
                for(var l = 0; l < indexs.length; l ++)
                {
                    pos[indexs[l]].col = ind;
                }
               
                ind ++;
            }
        }

    tr2 += '</tr>';
    tr3 += '</tr>';
       tr += tr2;
    tr += '</tr>';
   

    tr += tr3;

   

    var erow = rowName.length;

    var rownum = fistRow.length;
     var m =0;
     var l =0;
    for(k = 0; k < erow ; k ++)
    {

       if(k==l)
    	{
          tr +='<tr id ="y" >';
    			var snum = fistRow[m].secondRow.length ;
    		     	   tr +='<td rowspan="'+snum+'">'+fistRow[m].name+'</td>';
    		     	       			l += snum;
    		     	       			   m++;

    	}
    	else
    		{
          tr +='<tr id ="n" >';

    		}
    	
        tr+='<td>' + rowName[k] + '</td>';
        for(j = 0 ; j < col; j ++)
        {
                   tr += '<td>' + ' &nbsp; ' + '</td>' ;
        }
              tr += '</tr>';
    }


    report.innerHTML = '<table id="rep" align="center" border=0>' + tr + '</table>';
    for(i = 0; i < count ; i++)
    {
        var r = pos[i].row + 2;
       if(rep.rows[r].id=="y")
       {
         c = pos[i].col + 2;
      }
      else
      	{
      		      c = pos[i].col + 1;

      	}
       	
  
          rep.rows[r].cells[c].innerHTML=' &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; '+'√ ';
      
    }


}