function drawLapsStack(data, div) { 
    var n = data[0].length,
        stack = d3.layout.stack(),
        layers = stack.y(function(d) { 
                 parts = d.y.split(":");
                 result = parseFloat(parts[0]) + parseFloat(parts[1])/60.0; 
                 return result;
          })(data);

    var yGroupMax = d3.max(layers, function(layer) { return d3.max(layer, function(d) { return d.y; }); }),
        yStackMax = d3.max(layers, function(layer) { return d3.max(layer, function(d) { return d.y0 + d.y; }); });

    var margin = {top: 40, right: 10, bottom: 20, left: 10},
        width = 800 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;

    var y = d3.scale.ordinal()
        .domain(d3.range(1,n+1))
        .rangeRoundBands([0, height], .08);

    var x = d3.scale.linear()
        .domain([0, yStackMax])
        .range([0, width]);

    var color = d3.scale.linear()
        .domain([0, n - 1])
        .range(["#aad", "#556"]);

    var yAxis = d3.svg.axis()
        .scale(y)
        .tickSize(0)
        .tickPadding(6)
        .orient("left");

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var svg = d3.select(div).append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var layer = svg.selectAll(".layer")
        .data(layers)
        .enter().append("g")
        .attr("class", "layer")
        .style("fill", function(d, i) { return color(i); })
        .attr("transform", "translate(" + 2*margin.left + "," + 0 + ")");

    var rect = layer.selectAll("rect")
        .data(function(d) { return d; })
        .enter().append("rect")
        .attr("y", function(d) { return y(d.x); })
        .attr("x", function(d) { return x(d.y0); })
        .attr("width", function(d) { return x(d.y); })
        .attr("height", y.rangeBand());

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(" + margin.left + "," + height + ")")
        .call(xAxis);

    svg.append("g")
        .attr("class", "y axis")
        .attr("transform", "translate(" + margin.left + "," + 0 + ")")
        .call(yAxis);

    layer.selectAll(".bartext")
      .data(function(d) { return d; })
      .enter()
      .append("text")
      .attr("class", "bartext")
      .attr("text-anchor", "middle")
      .attr("x", function(d,i) {
            return x(d.y/2+d.y0); 
      })
    .attr("y", function(d,i) {
          return y(d.x)+y.rangeBand()/2;
    })
    .text(function(d){
         if (d.y < 0.01) { 
           return "";
         }
         return Math.floor(d.y) + ":" + d3.format("02d")(Math.floor((60*d.y)%60));
    });
}
