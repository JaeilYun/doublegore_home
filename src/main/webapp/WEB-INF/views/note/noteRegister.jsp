<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" session="true" %>

<div class="content">
	<div class="main-header">
		<h2>Text Editor</h2>
		<em>WYSIWYG and Markdown editor</em>
	</div>
	<div class="main-content">
		<div class="row">
			<div class="col-md-12">
				<!-- BASIC INPUT -->
				<div class="widget">
					<div class="widget-header">
						<h3><i class="fa fa-edit"></i> Basic Input</h3></div>
					<div class="widget-content">
						<div class="form-horizontal">
							<div class="form-group">
								<label class="col-md-1 control-label">Title</label>
								<div class="col-md-11">
									<input type="text" class="form-control" placeholder="Title">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-1 control-label">Type</label>
								<div class="col-md-11">
									<span class="input-group">
									<select class="form-control">
										<option value="cheese">Cheese</option>
										<option value="tomatoes">Tomatoes</option>
										<option value="mozarella">Mozzarella</option>
										<option value="mushrooms">Mushrooms</option>
										<option value="pepperoni">Pepperoni</option>
										<option value="onions">Onions</option>
									</select>
									<span class="input-group-addon" style="padding: 0px;">
										<button type="button" class="btn btn-primary btn-sm" style="height: 32px">
											<i class="fa fa-plus"></i>
										</button>
									</span></span>
								</div>
							</div>
						</div>
						<div class="form-horizontal">
							<div class="widget" style="margin-bottom: -10px;">
								<div class="widget-content no-padding">
									<div class="summernote">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="widget-footer" style="text-align: right;">
					<button type="button" class="btn btn-default note-back-btn"><i class="fa fa-arrow-left"></i> Back</button>
					<button type="button" class="btn btn-success note-save-btn"><i class="fa fa-floppy-o"></i> Save</button>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="backForm" name="backForm" method="post" action="/note/main">
</form>

<script>
    $(document).ready(function(){
        //*******************************************
        /*	SUMMERNOTE AND MARKDOWN TEXT EDITOR
        /********************************************/
        // if text editor page
        if( $('body').hasClass('text-editor') ) {
            $('.summernote').summernote({
                height: 500,
                focus: true,
                lang: 'ko-KR',
                onpaste: function() {
                    alert('You have pasted something to the editor');
                }
            });
        }

        $(".note-back-btn").on('click', function(){
			$("#backForm").submit();
		});
    });
</script>