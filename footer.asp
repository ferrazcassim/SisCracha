<script>

$(document)
  .on('show.bs.modal', '.modal', function(event) {
    $(this).appendTo($('body'));
  })
  .on('shown.bs.modal', '.modal.in', function(event) {
    setModalsAndBackdropsOrder();
  })
  .on('hidden.bs.modal', '.modal', function(event) {
    setModalsAndBackdropsOrder();
  });

function setModalsAndBackdropsOrder() {
  var modalZIndex = 1040;
  $('.modal.in').each(function(index) {
    var $modal = $(this);
    modalZIndex++;
    $modal.css('zIndex', modalZIndex);
    $modal.next('.modal-backdrop.in').addClass('hidden').css('zIndex', modalZIndex - 1);
});
  $('.modal.in:visible:last').focus().next('.modal-backdrop.in').removeClass('hidden');
}
</script>

<!--   Core JS Files   -->
<!-- <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script> -->
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<!-- The crop javascript  files -->
<script src="http://yui.yahooapis.com/3.17.2/build/yui/yui-min.js"></script>
<script src="crop/cropbox.js"></script>
<!-- <script src="crop/cropbox-min.js"></script> -->
<script type="text/javascript">
YUI().use('node', 'crop-box', function(Y){
    var options =
    {
        imageBox: '.imageBox',
        thumbBox: '.thumbBox',
        spinner: '.spinner',
        // imgSrc: 'avatar.png'
    }
    var cropper = new Y.cropbox(options);
    Y.one('#file').on('change', function(){
        var reader = new FileReader();
        reader.onload = function(e) {
            options.imgSrc = e.target.result;
            cropper = new Y.cropbox(options);
        }
        reader.readAsDataURL(this.get('files')._nodes[0]);
        this.get('files')._nodes = [];
    })
    Y.one('#btnCrop').on('click', function(){
        var img = cropper.getDataURL()
        Y.one('.cropped').append('<img src="'+img+'">');
    })
    Y.one('#btnZoomIn').on('click', function(){
        cropper.zoomIn();
    })
    Y.one('#btnZoomOut').on('click', function(){
        cropper.zoomOut();
    })
})
</script>
</body>
</html>
