function show_chart()
{
  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/userchart/"
  }).done(process_activity);
}


function show_chart2(id)
{

  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/interviewchart/?id=" + id
  }).done(process_activity2);

}

function process_activity(chartdata)
{
  $('#chart').empty();

  Morris.Line({
    element: 'chart',
    data: chartdata,
    xkey: 'date',
    ykeys: ['num_right'],
    labels: ['Score'],
    ymin: 'auto',
    ymax: 'auto'
  });
}

function process_activity2(chartdata2)
{
  $('#interviewchart').empty();

  Morris.Line({
    element: 'interviewchart',
    data: chartdata2,
    xkey: 'date',
    ykeys: ['percentage'],
    labels: ['Score'],
    ymin: 'auto',
    ymax: 'auto'
  });
}
