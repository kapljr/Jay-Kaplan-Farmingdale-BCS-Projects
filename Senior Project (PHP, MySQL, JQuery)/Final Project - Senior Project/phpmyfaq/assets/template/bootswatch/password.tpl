        <section>

            <header>
                <h2>{headerChangePassword}</h2>
            </header>

            <form id="formValues" action="#" method="post" class="form-horizontal">

                <div class="form-group">
                    <label class="col-lg-3 control-label">{msgUsername}</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="username" required="required" autofocus="autofocus" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">{msgEmail}</label>
                    <div class="col-lg-9">
                        <input type="email" class="form-control" name="email" required="required" />
                    </div>
                </div>
				
				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
					  <button class="btn btn-primary" type="submit" id="changepassword">
                        {msgSubmit}
                    </button>
					</div>
				</div>
				
            <div id="loader"></div>
            <div id="changepasswords"></div>

            <script type="text/javascript" >
                $(function() {
                    $('#changepassword').click(function() {
                        saveFormValues('changepassword', 'changepassword');
                    });
                    $('form#formValues').submit(function() { return false; });
                });
            </script>

        </section>