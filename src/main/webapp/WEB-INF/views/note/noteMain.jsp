<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" session="true" %>

<div class="content">
	<div class="main-header">
		<h2>Text Editor</h2>
		<em>WYSIWYG and Markdown editor</em>
	</div>
	<div class="main-content">
		<!-- WYSIWYG EDITOR -->
		<div class="widget">
			<div class="widget-header">
				<h3><i class="fa fa-edit"></i> WYSIWYG Text Editor</h3></div>
			<div class="widget-content no-padding">
				<div class="summernote">Hello there,
					<br/>
					<p>The toolbar can be customized and it also supports various callbacks such as <code>oninit</code>, <code>onfocus</code>, <code>onpaste</code> and many more.</p>
					<p>Please try <b>paste some texts</b> here</p>
				</div>
			</div>
			<div class="widget-footer">
				<button type="button" class="btn btn-primary"><i class="fa fa-floppy-o"></i> Save</button>
			</div>
		</div>
		<!-- END WYSIWYG EDITOR -->
		<!-- MARKDOWN EDITOR -->
		<div class="widget">
			<div class="widget-header">
				<h3><i class="fa fa-edit"></i> Markdown Text Editor</h3></div>
			<div class="widget-content no-padding">
				<textarea id="markdown-editor" name="markdown-content" data-provide="markdown" data-iconlibrary="fa" rows="10"></textarea>
			</div>
		</div>
		<!-- END MARKDOWN EDITOR -->
	</div>
</div>