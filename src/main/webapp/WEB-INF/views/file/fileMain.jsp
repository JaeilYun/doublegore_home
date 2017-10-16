<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" session="true" %>

<div class="content">
	<div class="main-header">
		<h2>File Manager</h2>
		<em>file manager with tree view and contextual menu</em>
	</div>
	<div class="main-content">
		<!-- FILE MANAGER -->
		<div class="file-manager">
			<ul class="list-inline file-main-menu">
				<li><a href="#" class="inactive file-top-menu-upload"><i class="fa fa-upload"></i> Upload</a></li>
				<li><a href="#" class="inactive file-top-menu menu-download"><i class="fa fa-download"></i> Download</a></li>
				<li><a href="#" class="inactive file-top-menu menu-delete"><i class="fa fa-close"></i> Delete</a></li>
				<li><a href="#" class="inactive file-top-menu"><i class="fa fa-eye"></i> View</a></li>
				<li><a href="#" class="inactive file-top-menu-select select"><i class="fa fa-square-o selectIcon"></i> Select</a></li>
			</ul>
			<div class="row">
				<div class="col-lg-2 col-md-4">
					<div class="well tree-wrapper" style="margin-top: -18px;">
						<div id="tree-file-manager"></div>
					</div>
				</div>
				<div class="col-lg-10 col-md-8" style="margin-top: -20px;">
					<div class="knowledge">
						<h3>
							<a href="#">
								<i class="fa fa-folder"></i> <span class="nodeName">Home</span>
								<span class="pull-right">
									<span class="nodeFileCount">0</span>개 / <span class="nodeFileSize">0GB</span>
								</span>
							</a>
						</h3>
					</div>
					<table id="datatable-file-manager" class="table table-sorting table-dark-header">
						<thead>
						<tr>
							<th class="col-lg-6">Name</th>
							<th class="col-lg-3">Last Modified</th>
							<th class="col-lg-2">Type</th>
							<th class="col-lg-1">Size</th>
						</tr>
						</thead>
						<tbody></tbody>
					</table>
					<div id="contextMenuFileManager">
						<ul class="dropdown-menu context-menu" role="menu">
							<li><a tabindex="-1" href="#"><i class="fa fa-download"></i> Download</a></li>
							<li><a tabindex="-1" href="#"><i class="fa fa-remove"></i> Delete</a></li>
							<li><a tabindex="-1" href="#"><i class="fa fa-eye"></i> View</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- END FILE MANAGER -->
	</div>
</div>

<input id="fileuploadButton" style="display: none;" type="file" name="file" multiple >
<button id="uploadModalButton" style="display: none;" data-toggle="modal" data-target="#uploadModal"></button>
<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 800px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">
				<div class="table-responsive">
					<!-- PROJECT TABLE -->
					<table class="table colored-header project-list">
						<thead>
						<tr>
							<th>Name</th>
							<th>Size</th>
							<th style="width: 300px;">Status</th>
							<th style="width: 10px;"></th>
						</tr>
						</thead>
						<tbody class="fileUploadBody">
						</tbody>
					</table>
					<!-- END PROJECT TABLE -->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success uploadStart"><i class="fa fa-floppy-o uploadStart-icon"></i> 전송</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> 닫기</button>
			</div>
		</div>
	</div>
</div>

<form id="downloadForm" name="downloadForm" method="post" action="/file/downloadFile">
	<input type="hidden" id="fileName" name="fileName">
	<input type="hidden" id="nodeId" name="nodeId">
</form>

<script src="${contextRoot}/assets/js/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

<script>
    var fileTable;
    var jstree;
    $(document).ready(function(){
        var uploaderArray = new Array();
        var selectedNode = "";
        $("#fileuploadButton").on("change", function(){
            uploaderArray = new Array();
            $(".fileUploadBody").empty();
            var uploadFiles = document.getElementById('fileuploadButton');
            $("#uploadModalButton").click();
            for (var i = 0; i < uploadFiles.files.length; i++) {
                var file = uploadFiles.files[i];
                // 비동기 파일 업로드를 시작한다.
				var uploader = new Uploader(file);
				uploaderArray.push(uploader);
            }
		});

        $("#uploadModal").blur(function(){
            $("#fileuploadButton").val("");
		});

        $(".uploadStart").on("click", function(){
            for(var i = 0; i < uploaderArray.length; i++) {
                uploaderArray[i].startUpload();
			}
		});

        function Uploader(file) {
            var self = this;
            this._file = file;
            this._xhr = new XMLHttpRequest();
            this._xhr.addEventListener("load", transferComplete);
            this._xhr.upload.addEventListener("progress", updateProgress);
            this._xhr.upload.addEventListener("error", transferFailed);

            // uploadList에 업로드 아이템을 하나 추가한다.
			var tr = document.createElement("tr");
			var fileName = document.createElement("td");
			var fileSize = document.createElement("td");
			var progress = document.createElement("td");
			var progressDiv = document.createElement("div");
			var progressBarDiv = document.createElement("div");
            var progressBarSpan = document.createElement("span");
            var deleteTd = document.createElement("td");
            var deleteIcon = document.createElement("i");
            progressBarDiv.setAttribute("class","dynamic-progress-bar progress-bar progress-bar-info progress-bar-striped active");
            progressBarDiv.setAttribute("role","progressbar");
            progressBarDiv.setAttribute("aria-valuenow","0");
            progressBarDiv.setAttribute("aria-valuemin","0");
            progressBarDiv.setAttribute("aria-valuemax","100");
            progressBarDiv.setAttribute("style","width: 0%");
            progressBarDiv.textContent = "0%";
            progressBarSpan.setAttribute("id","current-progress");
            progressBarDiv.append(progressBarSpan);
            progressDiv.setAttribute("class","progress");
            progressDiv.append(progressBarDiv);

			fileName.innerHTML = this._file.name;
            fileSize.innerHTML = numToDataUnit(this._file.size);
            progress.append(progressDiv);

            deleteIcon.setAttribute("class","fa fa-times fa-lg");
            deleteIcon.setAttribute("aria-hidden","true");
            deleteTd.append(deleteIcon);

            tr.append(fileName);
            tr.append(fileSize);
            tr.append(progress);
            tr.append(deleteTd);
            $(".fileUploadBody").append(tr);

            // 업로드를 시작시킨다.
            this.startUpload = function () {
                var fileObj = new Object();
                fileObj = this._file;
                var formData = new FormData();
                formData.append("uploadFile", this._file);
                formData.append("nodeId", selectedNode);
                var xhr = self._xhr;
                xhr.open("POST", "/file/uploadFile", true);
                $.ajax({
                    url: '/file/duplicatedFileCheck',
                    data: {
                        "fileName": this._file.name,
						"nodeId": selectedNode
                    },
                    type: 'POST',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    success: function (result) {
                        if(result == "T") {
                            xhr.send(formData);
						} else {
                            self._xhr.abort();
                            self._removeUploadItem();
                            var blob = fileObj.slice(0, -1, fileObj.type);
                            var fileName = getFileName(fileObj.name);
                            var fileExt = getFileExtension(fileObj.name);
                            var newFile = new File([blob], fileName+"_d"+fileExt, {type: fileObj.type});
                            var uploader = new Uploader(newFile);
                            uploader.startUpload();
						}
                    }
                });
            }

            deleteIcon.onclick = function(){
                self._xhr.abort();
                self._removeUploadItem();
			}

            this._removeUploadItem = function () {
                for(var i = 0; i < uploaderArray.length; i++){
                    if(this._file.name == uploaderArray[i]._file.name){
                        uploaderArray.splice(i,1);
					}
				}
                tr.remove();
            }

            // AJAX 데이터가 전송되는 동안 수시로 발생하는 이벤트로 진행 과정을 출력한다.
            function updateProgress(evt) {
                if (evt.lengthComputable) {
                    var percentComplete = Math.ceil(evt.loaded / evt.total * 100);
                    progressBarDiv.setAttribute("style","width: "+percentComplete+"%");
                    progressBarDiv.textContent = percentComplete+"%";
                    $(".uploadStart").prop("disabled",true);
                    $(".uploadStart-icon").removeClass("fa-floppy-o");
                    $(".uploadStart-icon").addClass("fa-spinner fa-spin");
                }
            }

            // 한 파일 업로드가 완료되면 호출되는 이벤트로 성공시 고유 값(이 예제에서는 파일 이름)이 반환된다.
            function transferComplete() {
                if (this.status == 200) {
                    progressBarDiv.textContent = "Success";
                    var result = new Array();
                    result.push(JSON.parse(this.responseText));
                    fileTable.rows.add(result).draw();

                    setFileAdded();
                } else {
                    progressBarDiv.setAttribute("class","dynamic-progress-bar progress-bar progress-bar-danger progress-bar-striped active");
                    progressBarDiv.textContent = "Fail";
                }
                $(".uploadStart").prop("disabled",false);
                $(".uploadStart-icon").addClass("fa-floppy-o");
                $(".uploadStart-icon").removeClass("fa-spinner fa-spin");
            }

            function transferFailed(evt) {
                progressBarDiv.setAttribute("class","dynamic-progress-bar progress-bar progress-bar-danger progress-bar-striped active");
                progressBarDiv.textContent = "Fail";
                console.log("An error occurred while transferring the file.");

                $(".uploadStart").prop("disabled",false);
                $(".uploadStart-icon").addClass("fa-floppy-o");
                $(".uploadStart-icon").removeClass("fa-spinner fa-spin");
            }
        }

        numToDataUnit = function(fileSize) {
            var size = fileSize;
            var dataUnit = 0;
            while(true) {
                if(size >= 1024) {
                    size = (size/1024).toFixed(2);
                    dataUnit++;
                } else if(size < 1024 && dataUnit == 0){
                    size = 1;
                    break;
                } else {
                    break;
                }
            }
            var unit = "";
            switch(dataUnit) {
                case 0:
                case 1:
                    unit = "KB";
                    break;
                case 2:
                    unit = "MB";
                    break;
                case 3:
                    unit = "GB";
                    break;
                case 4:
                    unit = "TB";
                    break;
            }
            return size + " " + unit;
        }

        //*******************************************
        /*  FILE MANAGER
        /********************************************/
        if($('#tree-file-manager').length > 0) {

            // file manager datatable
            fileTable = $('#datatable-file-manager').DataTable({
                bFilter: false,
                bInfo: false,
                paging: false,
                dom: 'T<"clear">',
                tableTools: {
                    "sRowSelect": "os",
                    "aButtons": [ ]
                },
                "language": {
                    "emptyTable": "파일이 없습니다~!"
                }
            });

            fileTable.clear().draw();

            $.ajax({
                url: '/file/selectJson',
                type: 'POST',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (result) {
                    // file manager tree
                    jstree = $('#tree-file-manager').jstree({
                        'core' : {
                            'data' : JSON.parse(result),
                            "check_callback" : true,
                            "multiple" : false
                        },
                        'plugins' : ["types", "contextmenu"],
                        'types' : {
                            'default' : {
                                'icon' : 'fa fa-folder'
                            },
                            'txt' : {
                                'icon' : 'fa fa-file-text-o'
                            },
                            'pdf' : {
                                'icon' : 'fa fa-file-pdf-o'
                            },
                            'doc' : {
                                'icon' : 'fa fa-file-word-o'
                            },
                            'docx' : {
                                'icon' : 'fa fa-file-word-o'
                            },
                            'xls' : {
                                'icon' : 'fa fa-file-excel-o'
                            },
                            'xlsx' : {
                                'icon' : 'fa fa-file-excel-o'
                            },
                            'ppt' : {
                                'icon' : 'fa fa-file-powerpoint-o'
                            },
                            'pptx' : {
                                'icon' : 'fa fa-file-powerpoint-o'
                            },
                            'img' : {
                                'icon' : 'fa fa-file-image-o'
                            },
                            'zip' : {
                                'icon' : 'fa fa-file-zip-o'
                            }
                        }

                    }).on('select_node.jstree', function(e, data) {
                        var node = data.instance.get_node(data.selected);
                        unCheckSelectAll();
                        $(".nodeName").text(node.text);
                        // since multiple selection is disabled, it's ok not to iterate array (data.selected)
                        if(data.selected == 'root') {
                            fileTable.clear().draw();
                            $(".file-top-menu").addClass("inactive");
                            $(".file-top-menu-upload").addClass("inactive");
							$(".file-top-menu-select").addClass("inactive");
                            setFileAdded();
                        } else {
                            $(".file-top-menu-upload").removeClass("inactive");
                            $(".file-top-menu-select").removeClass("inactive");
                            $(".file-top-menu").addClass("inactive");
                            $.ajax({
                                url: '/file/selectFile',
                                data: {
                                    "nodeId": data.selected.toString()
                                },
                                type: 'POST',
                                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                                success: function (result) {
                                    selectedNode = data.selected.toString();
                                    var fileArray = new Array();
                                    for(var i = 0; i < result.length; i++) {
                                        fileArray.push(result[i]);
                                    }
                                    fileTable.clear().rows.add(fileArray).draw();
                                    setFileAdded();
                                }
                            });
                        }
                    });
                }
            });

            $('#datatable-file-manager tbody').on( 'click', 'tr', function (e) {
                dataTableCountCheck();
            });

            $('#datatable-file-manager tbody').on( 'mousedown', 'tr', function (e) {
                // if right click
                if(e.button == 2) {
                    document.oncontextmenu = function() {return false;};

                    if(fileTable.rows().data().length > 0) {
                        $(".file-top-menu").removeClass("inactive");
                    }
                    //만약 선택이 안되어있다면 선택
                    if(!$(this).hasClass('DTTT_selected')) {
                        fileTable.$('tr.DTTT_selected').removeClass('DTTT_selected');
                        $(this).addClass('DTTT_selected');
                    }
                }
                // else if left click and ctrl/meta key released
                else if((e.button == 0) && !(e.ctrlKey || e.metaKey) ){
                    fileTable.$('tr.DTTT_selected').removeClass('DTTT_selected');
                    $(this).addClass('DTTT_selected');
                }
            });
        }

        function getFileExtension(filename) {
            var _fileLen = filename.length;
            var _lastDot = filename.lastIndexOf('.');
            var _fileExt = filename.substring(_lastDot, _fileLen).toLowerCase();
            return _fileExt;
        }

        function getFileName(filename) {
            var _fileLen = filename.length;
            var _lastDot = filename.lastIndexOf('.');
            var _fileName = filename.substring(0, _lastDot).toLowerCase();
            return _fileName;
        }

        $(".menu-delete").on("click", function(e) {
            e.preventDefault();
            deleteFile();
		});

        //개별 다운로드
        menuDownload = function() {
            var fileNameArr = [];
            var rows = $('tr.DTTT_selected');
            var rowData = fileTable.rows(rows).data();
            $("#fileName").val(rowData[0][0].split("&nbsp;")[2]);
            $("#nodeId").val(jstree.jstree('get_selected').toString());
            $("#downloadForm").attr("action","/file/downloadFile");
            $("#downloadForm").submit();
		}

		deleteFile = function(){
            var fileNameArr = [];
            var rows = $('tr.DTTT_selected');
            var rowData = fileTable.rows(rows).data();
            $.each($(rowData),function(key,value){
                fileNameArr.push(value[0].split("&nbsp;")[2]);
            });
            $.ajax({
                url: '/file/deleteFile',
                data: {
                    "fileNameList" : fileNameArr,
                    "nodeId" : jstree.jstree('get_selected').toString()
                },
                type: 'POST',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (result) {
                    fileTable.rows(rows).remove().draw();
                    dataTableCountCheck();
                }
            });
		}

        $(".menu-download").on("click", function(e) {
            e.preventDefault();
            var fileNameArr = [];
            var rows = $('tr.DTTT_selected');
            var rowData = fileTable.rows(rows).data();
            $.each($(rowData),function(key,value) {
                fileNameArr.push(value[0].split("&nbsp;")[2]);
            });
            $("#fileName").val(fileNameArr);
            $("#nodeId").val(jstree.jstree('get_selected').toString());

            if(fileNameArr.length > 1) {
                $.ajax({
                    url: '/file/downloadZipFile',
                    data: {
                        "fileNameList" : fileNameArr,
                        "nodeId" : jstree.jstree('get_selected').toString()
                    },
                    type: 'POST',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    success: function (result) {
                        alert(result);
                    }
                });
			} else {
                $("#downloadForm").attr("action","/file/downloadFile");
                $("#downloadForm").submit();
			}
        });

        $(".select").on("click", function(){
            if($(".selectIcon").hasClass('fa-square-o')) {
                checkSelectAll();
                dataTableSelectAll();
            } else {
                unCheckSelectAll();
                dataTableUnSelectAll();
            }
            dataTableCountCheck();
        });

        $(".file-top-menu-upload").on("click", function(e){
            e.preventDefault();
            if(!$(this).hasClass("inactive")){
                $("#fileuploadButton").click();
			}
		});

        nodeFileSize = function() {
            var totalSize = 0;
            var result;
            var rowData = fileTable.rows().data();
            $.each($(rowData),function(key,value){
                var size = value[3].split(" ")[0];
                var unit = value[3].split(" ")[1];
                if(unit == 'KB') {
                    totalSize += size/1000;
				} else if(unit == 'MB') {
                    totalSize += size*1;
				} else if(unit == 'GB') {
                    totalSize += size*1000;
				}
				totalSize = totalSize.toFixed(2)*1;
            });

            if(totalSize > 1024) {
                result = totalSize/1000 + "GB";
			} else {
                result = totalSize + "MB";
			}
			$(".nodeFileSize").text(result);
		}

		setFileAdded = function(){
            //전체 갯수 설정
            $(".nodeFileCount").text(fileTable.rows().data().length);
            //전체 용량 설정
            nodeFileSize();

            if(fileTable.rows().data().length > 0) {
                $("#datatable-file-manager td").contextmenu({
                    target: '#contextMenuFileManager',
                    onItem: function(context, e) {
                        if($(e.target).text() == ' Download') {
                            menuDownload();
                        } else if($(e.target).text() == ' Delete') {
                            deleteFile();
                        }
                    }
                });
            }
		}

        checkSelectAll = function(){
            $(".selectIcon").removeClass('fa-square-o');
            $(".selectIcon").addClass('fa-check-square-o');
        }
        unCheckSelectAll = function(){
            $(".selectIcon").removeClass('fa-check-square-o');
            $(".selectIcon").addClass('fa-square-o');
        }
        dataTableSelectAll = function(){
            fileTable.$('tr').addClass('DTTT_selected');
        }
        dataTableUnSelectAll = function(){
            fileTable.$('tr').removeClass('DTTT_selected');
        }
        dataTableCountCheck = function(){
            if(fileTable.rows(".DTTT_selected").data().length > 0) {
                $(".file-top-menu").removeClass("inactive");
            } else {
                $(".file-top-menu").addClass("inactive");
            }
		}
    });
</script>