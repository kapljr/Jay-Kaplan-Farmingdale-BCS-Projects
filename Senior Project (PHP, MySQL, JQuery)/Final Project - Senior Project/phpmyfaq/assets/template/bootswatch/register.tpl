		<section>
            <header>
                <h2>{msgRegistration}</h2>
            </header>

            <p>{msgRegistrationCredentials} {msgRegistrationNote}</p>

            <div id="registrations"></div>

            <form class="form-horizontal" id="formValues" method="post" action="#">
                <input type="hidden" name="lang" id="lang" value="{lang}" />

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="realname">{realname}</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="realname" id="realname" required="required" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="name">{loginname}</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="name" id="name" required="required" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="email">{email}</label>
                    <div class="col-lg-9">
                        <input type="email" class="form-control" name="email" id="email" required="required" />
                    </div>
                </div>
				
				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
						{captchaFieldset}
					</div>
				</div>	

                <div id="loader"></div>

				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
						<button class="btn btn-primary" type="submit" id="submitregistration">
							{submitRegister}
						</button>
					</div>
				</div>
            </form>
            <script type="text/javascript" >
            $(function() {
                $('#submitregistration').click(function() {
                    saveFormValues('saveregistration', 'registration');
                });
                $('form#formValues').submit(function() { return false; });
            });
            </script>

        </section>
