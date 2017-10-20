<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" session="true" %>

<div class="content">
	<div class="main-header">
		<h2>Text Editor</h2>
		<em>WYSIWYG and Markdown editor</em>
	</div>
	<div class="main-content">
		<div class="widget">
			<div class="widget-header">
				<h3><i class="fa fa-inbox"></i> Quick Inbox</h3>
				<div class="btn-group widget-header-toolbar">
					<a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
				</div>
			</div>
			<div class="widget-content">
				<ul class="list-unstyled quick-inbox-list" style="margin-bottom: -10px;">
					<li class="unread">
						<div style="padding: 0 5px 0 5px; margin: -8px 0 -10px 0;">
							<div class="header">
								<h4 class="title"><a href="#"><span>Password Reset</span><span class="timestamp pull-right">3 hours ago</span></a></h4>
							</div>
							<a href="#" class="brief">Hi, Conveniently drive effective methods of empowerment through cross-unit innovation.  ...</a>
						</div>
					</li>
					<li class="unread">
						<div style="padding: 0 5px 0 5px; margin: -8px 0 -10px 0;">
							<div class="header">
								<h4 class="title"><a href="#"><span>Password Reset</span><span class="timestamp pull-right">3 hours ago</span></a></h4>
							</div>
							<a href="#" class="brief">Hi, Conveniently drive effective methods of empowerment through cross-unit innovation.  ...</a>
						</div>
					</li>
					<li class="unread">
						<div style="padding: 0 5px 0 5px; margin: -8px 0 -10px 0;">
							<div class="header">
								<h4 class="title"><a href="#"><span>Weekly Meeting</span><span class="timestamp pull-right">2m ago</span></a></h4>
							</div>
							<a href="#" class="brief">Hi Amanda, Quickly myocardinate business functionalities for synergistic systems ...</a>
						</div>
					</li>
					<li class="unread">
						<div style="padding: 0 5px 0 5px; margin: -8px 0 -10px 0;">
							<div class="header">
								<h4 class="title"><a href="#"><span>Password Reset</span><span class="timestamp pull-right">3 hours ago</span></a></h4>
							</div>
							<a href="#" class="brief">Hi, Conveniently drive effective methods of empowerment through cross-unit innovation.  ...</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- INBOX -->
		<div class="well">
		<div class="inbox">
			<div class="top">
				<div class="row">
					<div class="col-lg-2">
						<form id="noteNewForm" name="noteNewForm" method="post" action="/note/register">
							<button class="btn btn-primary btn-block btn-compose"><i class="fa fa-pencil"></i> NEW</button>
						</form>
					</div>
					<div class="col-lg-10">
						<div class="top-menu">
							<label class="control-inline fancy-checkbox fancy-checkbox-all">
								<input type="checkbox">
								<span>&nbsp;</span>
							</label>
							<ul class="list-inline top-menu-group1 hide">
								<li>
									<button type="button" class="btn"><i class="fa fa-trash-o"></i> DELETE</button>
								</li>
								<li>
									<button type="button" class="btn"><i class="fa fa-warning"></i> SPAM</button>
								</li>
								<li>
									<div class="btn-group">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
											<i class="fa fa-folder"></i> MOVE <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">My Folder</a></li>
											<li><a href="#">My Other Folder</a></li>
										</ul>
									</div>
								</li>
							</ul>
							<ul class="list-inline top-menu-group2">
								<li class="top-menu-label hide">
									<div class="btn-group">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
											<i class="fa fa-tags"></i> LABEL <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">Blog Comments</a></li>
											<li><a href="#">New Users</a></li>
											<li><a href="#">Password</a></li>
										</ul>
									</div>
								</li>
								<li class="top-menu-more">
									<div class="btn-group">
										<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
											<i class="fa fa-list"></i> MORE <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li class="mark-all"><a href="#">Mark All As Read</a></li>
											<li class="hide mark-read"><a href="#">Mark As Read</a></li>
											<li class="hide mark-unread"><a href="#">Mark As Unread</a></li>
											<li class="hide add-star"><a href="#">Add Star</a></li>
										</ul>
									</div>
								</li>
							</ul>
							<div class="navigation">
								<button type="button" class="btn btn-link hidden-sm hidden-md hidden-lg inbox-nav-toggle"><i class="fa fa-bars"></i></button>
								<div class="pager-wrapper">
									<span class="info">Showing 1-10 of 32</span>
									<ul class="pager">
										<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
										<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- /top-menu -->
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /top -->
			<div class="bottom">
				<div class="row">
					<!-- inbox left menu -->
					<div class="col-xs-12 col-sm-3 col-lg-2 inbox-left-menu">
						<h3 class="sr-only">Inbox Menu</h3>
						<ul class="list-unstyled left-menu">
							<li><a href="#"><i class="fa fa-stop pull-left label1" style="margin-top: 2px;"></i> Inbox
								<span class="badge pull-right" style="margin-top: -1px;">32</span></a></li>
							<li><a href="#"><i class="fa fa-stop pull-left label2" style="margin-top: 2px;"></i> Starred
								<span class="badge pull-right" style="margin-top: -1px;">12</span></a></li>
							<li><a href="#"><i class="fa fa-stop pull-left label3" style="margin-top: 2px;"></i> Drafts
								<span class="badge pull-right" style="margin-top: -1px;">3</span></a></li>
						</ul>
					</div>
					<!-- end inbox left menu -->
					<!-- right main content, the messages -->
					<div class="col-xs-12 col-sm-9 col-lg-10">
						<div class="messages">
							<table class="table-condensed message-table">
								<colgroup>
									<col class="col-check">
									<col class="col-title">
									<col class="col-attachment">
									<col class="col-timestamp">
								</colgroup>
								<tbody>
								<tr class="unread">
									<td>
										<label class="fancy-checkbox">
											<input type="checkbox">
											<span>&nbsp;</span>
										</label>
									</td>
									<td><span class="message-label label2">New User</span>
										<span class="title">New User Registration</span> <span class="preview">- A new user has been registered on your site but not yet activated. You can activate this user on </span></td>
									<td><span class="icon-attachment"><i class="fa fa-paperclip"></i></span></td>
									<td><span class="timestamp">12:01 PM</span></td>
								</tr>
								<tr class="unread">
									<td>
										<label class="fancy-checkbox">
											<input type="checkbox">
											<span>&nbsp;</span>
										</label>
									</td>
									<td><span class="title">Can I Change My Username?</span> <span class="preview">- I've been wondering if we actually can change our username on the front-end. This should be</span></td>
									<td><span class="icon-attachment"><i class="fa fa-paperclip"></i></span></td>
									<td><span class="timestamp">10:46 AM</span></td>
								</tr>
								<tr class="unread">
									<td>
										<label class="fancy-checkbox">
											<input type="checkbox">
											<span>&nbsp;</span>
										</label>
									</td>
									<td><span class="message-label label3">Password</span>
										<span class="title">Request For New Password</span> <span class="preview">- Hi Stacy, I try to reset maybe you can check some of my example. I was't really understand why this is happening ...</span></td>
									<td>&nbsp;</td>
									<td><span class="timestamp">09:22 AM</span></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- end right main content, the messages -->
				</div>
			</div>
		</div>
		<!-- END INBOX -->
		</div>
	</div>
</div>

<script>
    $(document).ready(function(){

    });
</script>