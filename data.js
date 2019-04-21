var chart;
$.ajaxSetup({
    cache: false
});

var cfb;
var data = [];
var range;

function initGraph() {
    var url = "data.xlsx";

    var oReq = new XMLHttpRequest();
    oReq.open("GET", url, true);
    oReq.responseType = "arraybuffer";

    oReq.onload = function(e) {
        var arraybuffer = oReq.response;

        /* convert data to binary string */
        var data = new Uint8Array(arraybuffer);

        var arr = new Array();
        for (var i = 0; i != data.length; ++i) {
            arr[i] = String.fromCharCode(data[i]);
        }

        var bstr = arr.join("");

        cfb = XLSX.read(bstr, {
            type: 'binary'
        });
        console.log(cfb);
        var sheetRange = cfb.Sheets[cfb.SheetNames[0]];
        range = XLSX.utils.decode_range(sheetRange['!ref']);
        graph();

    }
    oReq.send();
    chart = new CanvasJS.Chart("chartContainer", {

        data: [{
            type: "line",

            dataPoints: data

        }]
    });
}

function graph() {


    for (let rowNum = 1; rowNum <= range.e.r; rowNum++) {

        var object = {};
        object["x"] = cfb["Sheets"]["Sheet1"]["A" + rowNum].v

        object["y"] = cfb["Sheets"]["Sheet1"]["B" + rowNum].v
        console.log(object)
        data.push(object);

    }


    chart.render();
}
initGraph();
