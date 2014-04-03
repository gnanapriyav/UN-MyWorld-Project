var fs   = require('fs');
var http = require('http');

var options = {
  'host'    : 'data.un.org',
  'path'    : '/ws/NSIStdV20Service.asmx',
  'method'  : 'POST',
  'headers' : {
    'Content-Type' : 'application/soap+xml; charset=utf-8',
    // 'Content-Length' : 256
  }
}

var query = '<?xml version="1.0" encoding="utf-8"?>'
+ ' <soap12:Envelope                                                                                            '
+ ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"                                                       '
+ ' xmlns:xsd="http://www.w3.org/2001/XMLSchema"                                                                '
+ ' xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">                                                     '
+ '   <soap12:Body>                                                                                             '
+ '     <GetCompactData xmlns="http://ec.europa.eu/eurostat/sri/service/2.0">                                   '
+ '       <Query>                                                                                               '
//
// put your xml here
//
// + '         <QueryMessage                                                                                       '
// + '           xmlns:query="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/query"                             '
// + '           xmlns="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/message"                                 '
// + '           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"                                             '
// + '           xmlns:common="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/common"                           '
// + '           xsi:schemaLocation="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/message SDMXMessage.xsd">   '
// + '           <Header>                                                                                          '
// + '             <ID>NSICLIENT</ID>                                                                              '
// + '             <Test>false</Test>                                                                              '
// + '             <Prepared>2014-03-31T19:33:40</Prepared>                                                        '
// + '             <Sender id="NSICLIENT"/>                                                                        '
// + '             <Receiver id="NSIWS"/>                                                                          '
// + '           </Header>                                                                                         '
// + '           <Query>                                                                                           '
// + '             <query:DataWhere>                                                                               '
// + '               <query:And>                                                                                   '
// + '                 <query:Dataflow>DF_UNData_UIS</query:Dataflow>                                              '
// + '                 <query:And>                                                                                 '
// + '                   <query:Or>                                                                                '
// + '                     <query:Dimension id="SERIES">SLE_0</query:Dimension>                                    '
// + '                     <query:Dimension id="SERIES">THAGE_0</query:Dimension>                                  '
// + '                   </query:Or>                                                                               '
// + '                 </query:And>                                                                                '
// + '               </query:And>                                                                                  '
// + '             </query:DataWhere>                                                                              '
// + '           </Query>                                                                                          '
// + '         </QueryMessage>                                                                                     '
+ '       </Query>                                                                                              '
+ '     </GetCompactData>                                                                                       '
+ '   </soap12:Body>                                                                                            '
+ ' </soap12:Envelope>                                                                                          '

var get_xml = function( options, query, callback ) {
  http.request( options, function(res) {
    var body = '';
    res.on('data', function(chunk) {
      return body += chunk;
    });
    res.on('end', function() {
      return callback( null, body );
    });
  }).on('error', function(e) {
    console.log('problem with request: ' + e.message);
    return callback( e, null );
  }).end(query);
}

get_xml( options, query, function(err, body) {
  fs.writeFile("./data.txt", body, function(err) {
      if(err) {
          console.log(err);
      } else {
          console.log("The file was saved!");
      }
  });
});